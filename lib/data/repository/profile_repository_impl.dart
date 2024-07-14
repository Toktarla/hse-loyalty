

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hsg_loyalty/data/data_source/remote/profile/profile_api.dart';
import 'package:hsg_loyalty/data/model/user/profile_model.dart';
import 'package:hsg_loyalty/domain/entity/user/profile_entity.dart';
import 'package:hsg_loyalty/domain/repository/profile_repository.dart';
import 'package:hsg_loyalty/injection_container.dart';
import 'package:hsg_loyalty/utils/resources/data_state.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileApi _profileApi;


  ProfileRepositoryImpl(this._profileApi);

  @override
  Future<DataState<ProfileEntity>> getProfile(String cookie) async {
    try {
      final httpResponse = await _profileApi.getProfile(cookie);

      ProfileModel profileModel = httpResponse.data;

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(profileModel.toEntity());
      } else {
        return DataFailure(
          DioException(
            message: httpResponse.response.statusMessage ?? 'Error occurred in HTTP RESPONSE',
            error: httpResponse.response.statusMessage ?? 'Unknown error',
            response: httpResponse.response,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailure(e);
    }
  }

  @override
  Future<DataState<String>> login(Map<String, String> requestBody) async {
    final prefs = sl<SharedPreferences>();

    try {

      final httpResponse = await _profileApi.login(requestBody);

      final tokenList = httpResponse.response.headers['Set-Cookie'];
      String? token;
      if (tokenList != null && tokenList.isNotEmpty) {
        token = tokenList[2].split(";")[0];
      }

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        final userOrganization = httpResponse.data.organization;
        final userOrganizationId = httpResponse.data.organizationId;

        prefs.setString('userOrganization', userOrganization ?? "");
        prefs.setInt('userOrganizationId', userOrganizationId ?? -1);

        return DataSuccess(token!);
      } else {
        return DataFailure(DioException(
          message: "Token not valid", requestOptions: RequestOptions(
        )
        ));
      }
    } on DioException catch (e) {
      return DataFailure(e);
    }
  }


}