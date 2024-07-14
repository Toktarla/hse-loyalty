import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hsg_loyalty/data/data_source/remote/departure-report/departure_report_api.dart';
import 'package:hsg_loyalty/data/model/create/isSuccessResponse.dart';
import 'package:hsg_loyalty/data/model/departure-report/departure_report_model.dart';
import 'package:hsg_loyalty/domain/entity/departure-report/departure_report_entity.dart';
import 'package:hsg_loyalty/domain/repository/departure_report_repository.dart';
import 'package:hsg_loyalty/injection_container.dart';
import 'package:hsg_loyalty/utils/resources/data_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entity/departure-report/departure_report_answer_Entity.dart';

class DepartureReportRepositoryImpl extends DepartureReportRepository {
  final DepartureReportApi _departureReportApi;

  DepartureReportRepositoryImpl(this._departureReportApi);

  @override
  Future<DataState<IsSuccessResponse>> deleteDepartureReportForm(int departureReportId,String cookie) async {
    try {
      final httpResponse = await _departureReportApi.deleteDepartureReportForm(departureReportId,cookie);
      
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        final data = httpResponse.data;
        return DataSuccess(data);
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
  Future<DataState<DepartureReportEntity>> getDepartureReportForm(String cookie, int userId) async {
    try {
      final httpResponse = await _departureReportApi.getDepartureReportForm(cookie, userId); 
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        final data = httpResponse.data;
        return DataSuccess(data);
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
  Future<DataState<DepartureReportAnswerEntity>> getDepartureReportFormList(String cookie) async {
    try {
      final httpResponse = await _departureReportApi.getDepartureReportFormList(cookie);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        final data = httpResponse.data;
        return DataSuccess(data);
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
  Future<DataState<DepartureReportAnswerEntity>> getDepartureReportFormListForUser(String cookie) async {
    try {
      final httpResponse = await _departureReportApi.getDepartureReportFormListForUser(cookie);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        final data = httpResponse.data;
        return DataSuccess(data);
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
  Future<DataState<IsSuccessResponse>> saveDepartureReportForm(DepartureReportEntity departureReport) async {
    final _prefs = sl<SharedPreferences>();
    try {
      final httpResponse = await _departureReportApi.saveDepartureReportForm(departureReport.toModel(),_prefs.getString("authToken") ?? "");
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        final data = httpResponse.data;
        return DataSuccess(data);
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


