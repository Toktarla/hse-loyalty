import 'dart:io';
import 'package:dio/dio.dart';
import 'package:hsg_loyalty/domain/entity/questionnaires/questionnaire_entity.dart';
import 'package:hsg_loyalty/domain/entity/questionnaires/questionnaire_form_entity.dart';
import 'package:hsg_loyalty/domain/repository/questionnaire_repository.dart';
import 'package:hsg_loyalty/utils/resources/data_state.dart';
import '../data_source/remote/guestionnaires/questionnaire_api.dart';
import '../model/create/isSuccessResponse.dart';

class QuestionnaireRepositoryImpl extends QuestionnaireRepository {
  final QuestionnaireApi _questionnaireApi;


  QuestionnaireRepositoryImpl(this._questionnaireApi);

  @override
  Future<DataState<QuestionnaireFormEntity>> getQuestionnaireById(String id) async {
    try {
      final httpResponse = await _questionnaireApi.getQuestionnaireById(id);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailure(
          DioException(
            message: httpResponse.response.statusMessage ?? 'Failed to fetch questionnaire form',
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
  Future<DataState<QuestionnaireEntity>> getQuestionnaires(String page) async {
    try {
      final httpResponse = await _questionnaireApi.getQuestionnaires(page);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailure(
          DioException(
            message: httpResponse.response.statusMessage ?? 'Failed to fetch questionnaires',
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
  Future<DataState<IsSuccessResponse>> saveQuestionnaireAnswer(QuestionnaireFormEntity requestBody) async {
    try {
      final httpResponse = await _questionnaireApi.saveQuestionnaireAnswer(requestBody.toModel());
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailure(
          DioException(
            message: httpResponse.response.statusMessage ?? 'Failed to fetch questionnaires',
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


