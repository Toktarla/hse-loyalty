import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hsg_loyalty/data/data_source/remote/module/mobile_module_api.dart';
import 'package:hsg_loyalty/domain/entity/module/mobile_module_entity.dart';
import 'package:hsg_loyalty/domain/entity/module/mobile_module_file_entity.dart';
import 'package:hsg_loyalty/domain/repository/mobile_module_repository.dart';
import 'package:hsg_loyalty/utils/resources/data_state.dart';

class MobileModuleRepositoryImpl extends MobileModuleRepository {
  final MobileModuleApi _mobileModuleApi;

  MobileModuleRepositoryImpl(this._mobileModuleApi);

  @override
  Future<DataState<List<MobileModuleFileEntity>>> getMobileModuleFile(int id) async {
    try {
      final httpResponse = await _mobileModuleApi.getMobileModuleFile(id);
      final mobileModulesFile = httpResponse.data.map((data) => data.toEntity()).toList();

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(mobileModulesFile);
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
  Future<DataState<List<MobileModuleEntity>>> getMobileModules() async {
    try {
      final httpResponse = await _mobileModuleApi.getMobileModules();
      final mobileModules = httpResponse.data.map((data) => data.toEntity()).toList();

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(mobileModules);
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
