import 'dart:io';
import 'package:dio/dio.dart';
import 'package:hsg_loyalty/data/model/vitalrules/creation_page_model.dart';
import 'package:hsg_loyalty/data/model/vitalrules/user_answers_dto_model.dart';
import 'package:hsg_loyalty/data/model/vitalrules/vital_rule_form_model.dart';
import 'package:hsg_loyalty/domain/entity/user/isSuccessResponse_entity.dart';
import 'package:hsg_loyalty/domain/entity/vitalrule/creation_page_entity.dart';
import 'package:hsg_loyalty/domain/entity/vitalrule/user_answers_dto_entity.dart';
import 'package:hsg_loyalty/domain/entity/vitalrule/vital_rule_form_entity.dart';
import 'package:hsg_loyalty/domain/repository/vital_rules_repository.dart';
import 'package:hsg_loyalty/injection_container.dart';
import 'package:hsg_loyalty/utils/resources/data_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data_source/remote/vitalrules/vital_rules_api.dart';
import '../model/create/isSuccessResponse.dart';


class VitalRulesRepositoryImpl extends VitalRulesRepository {
  final VitalRulesApi _vitalRulesApi;
  final SharedPreferences _prefs;

  VitalRulesRepositoryImpl(this._vitalRulesApi, this._prefs);

  @override
  Future<DataState<IsSuccessResponse>> deleteVitalRuleForm(int formId) async {
    try {
      final httpResponse = await _vitalRulesApi.deleteVitalRuleForm(formId,_prefs.getString("authToken") ?? "");

      IsSuccessResponse isSuccessResponse = httpResponse.data;

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(isSuccessResponse);
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
  Future<DataState<UserAnswersDtoModel>> getVitalRuleForm(String cookie, int formId) async {
    try {
      final httpResponse = await _vitalRulesApi.getVitalRuleForm(cookie,formId);

      UserAnswersDtoModel vitalRulesModel = httpResponse.data;

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(vitalRulesModel);
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
  Future<DataState<VitalRuleFormEntity>> getVitalRuleFormList(String cookie,bool getAll) async {
    try {
      final httpResponse = await _vitalRulesApi.getVitalRuleFormList(cookie,getAll);

      VitalRuleFormModel vitalRulesModel = httpResponse.data;

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(vitalRulesModel.toEntity());
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
  Future<DataState<IsSuccessResponse>> saveVitalRuleForm(UserAnswersDtoEntity requestBody) async {
    try {
      final httpResponse = await _vitalRulesApi.saveVitalRuleForm(requestBody.toModel(),_prefs.getString("authToken") ?? "");

      IsSuccessResponse isSuccessResponse = httpResponse.data;

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(isSuccessResponse);
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
  Future<DataState<CreationPageEntity>> getVitalRuleCreationPage(String cookie) async {
    try {
      final httpResponse = await _vitalRulesApi.getVitalRuleCreationPage(cookie);

      CreationPageModel data = httpResponse.data;

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(data);
      }
      else {
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
}

