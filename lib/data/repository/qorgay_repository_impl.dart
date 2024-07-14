
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hsg_loyalty/data/model/create/isSuccessResponse.dart';
import 'package:hsg_loyalty/domain/entity/create/create_qorgay_entity.dart';
import 'package:hsg_loyalty/domain/entity/create/departament_entity.dart';
import 'package:hsg_loyalty/domain/entity/create/observation_category_entity.dart';
import 'package:hsg_loyalty/domain/entity/create/observation_type_entity.dart';
import 'package:hsg_loyalty/domain/entity/create/organization_entity.dart';
import 'package:hsg_loyalty/domain/entity/list/qorgay_entity.dart';
import 'package:hsg_loyalty/domain/repository/qorgay_repository.dart';
import 'package:hsg_loyalty/utils/resources/data_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../injection_container.dart';
import '../data_source/remote/qorgay/qorgay_api.dart';

class QorgayRepositoryImpl extends QorgayRepository {
  final QorgayApi _qorgayApi;
  final SharedPreferences _prefs = sl<SharedPreferences>();

  QorgayRepositoryImpl(this._qorgayApi);

  @override
  Future<DataState<IsSuccessResponse>> addQorgay(CreateQorgayEntity? requestBody) async {
    try {
      final httpResponse = await _qorgayApi.addQorgay(requestBody!.toModel());
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailure(
          DioException(
            message: 'Error occurred in HTTP RESPONSE',
            error: 'Unknown error',
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
  Future<DataState<List<DepartmentEntity>>> getDepartments(int organizationId) async {
    try {
      final httpResponse = await _qorgayApi.getDepartments(organizationId);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        final departmentList = httpResponse.data.map((data) => data.toEntity()).toList();
        return DataSuccess(departmentList);
      } else {
        return DataFailure(
          DioException(
            message: 'Error occurred in HTTP RESPONSE',
            error: 'Unknown error',
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
  Future<DataState<List<ObservationCategoryEntity>>> getObservationCategories() async {
    try {
      final httpResponse = await _qorgayApi.getObservationCategories();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        final categoryList = httpResponse.data.toList();
        return DataSuccess(categoryList);
      } else {
        return DataFailure(
          DioException(
            message: 'Error occurred in HTTP RESPONSE',
            error: 'Unknown error',
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
  Future<DataState<List<ObservationTypeEntity>>> getObservationTypes() async {
    try {
      final httpResponse = await _qorgayApi.getObservationTypes();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        final typeList = httpResponse.data..toList();
        return DataSuccess(typeList);
      } else {
        return DataFailure(
          DioException(
            message: 'Error occurred in HTTP RESPONSE',
            error: 'Unknown error',
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
  Future<DataState<List<OrganizationEntity>>> getOrganizations() async {
    try {
      final httpResponse = await _qorgayApi.getOrganizations();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        final organizationList = httpResponse.data..toList();
        return DataSuccess(organizationList);
      } else {
        return DataFailure(
          DioException(
            message: 'Error occurred in HTTP RESPONSE',
            error: 'Unknown error',
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
  Future<DataState<List<QorgayEntity>>> getQorgayList() async {

    final String? cookie = _prefs.getString("authToken");
      try {
        final httpResponse = await _qorgayApi.getQorgayList(cookie ?? "");
        if (httpResponse.response.statusCode == HttpStatus.ok) {
          final qorgayList = httpResponse.data.map((data) => data.toEntity()).toList();
          return DataSuccess(qorgayList);
        }
        else {
          return DataFailure(
            DioException(
              message: 'Error occurred in HTTP RESPONSE',
              error: 'Unknown error',
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
  Future<DataState<List<QorgayEntity>>> getQorgaysByUserId(int userId) async {
    try {
      final httpResponse = await _qorgayApi.getQorgaysByUserId(userId,_prefs.getString('authToken') ?? "");
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        final qorgayList = httpResponse.data.map((data) => data.toEntity()).toList();
        return DataSuccess(qorgayList);
      } else {
        return DataFailure(
          DioException(
            message: 'Error occurred in HTTP RESPONSE',
            error: 'Unknown error',
            response: httpResponse.response,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailure(e);
    }
  }
}
