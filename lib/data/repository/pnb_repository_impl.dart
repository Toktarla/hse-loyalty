import 'dart:io';
import 'package:dio/dio.dart';
import 'package:hsg_loyalty/data/model/create/isSuccessResponse.dart';
import 'package:hsg_loyalty/domain/entity/pnb/driving/pnb_driving_observation_entity.dart';
import 'package:hsg_loyalty/domain/entity/pnb/driving/pnb_driving_observation_form_entity.dart';
import 'package:hsg_loyalty/domain/entity/pnb/pnbwork/place_entity.dart';
import 'package:hsg_loyalty/domain/entity/pnb/pnbwork/place_item_entity.dart';
import 'package:hsg_loyalty/domain/entity/pnb/pnbwork/pnb_work_observation_entity.dart';
import 'package:hsg_loyalty/domain/entity/pnb/pnbwork/pnb_work_observation_form_entity.dart';
import 'package:hsg_loyalty/domain/repository/pnb_repository.dart';
import 'package:hsg_loyalty/utils/resources/data_state.dart';

import '../data_source/remote/pnb/pnb_api.dart';
import '../model/pnb/work/work_observation_model.dart';

class PnbRepositoryImpl extends PnbRepository {
  final PnbApi _pnbApi;

  PnbRepositoryImpl(this._pnbApi);

  @override
  Future<DataState<List<PlaceEntity>>> getAllPnbPlace() async {
    try {
      final httpResponse = await _pnbApi.getAllPnbPlace();

      final pnbPlaces = httpResponse.data;

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(pnbPlaces);
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
  Future<DataState<List<PlaceItemEntity>>> getAllPnbPlaceItem() async {
    try {
      final httpResponse = await _pnbApi.getAllPnbPlaceItem();

      final pnbPlaces = httpResponse.data;

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(pnbPlaces);
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
  Future<DataState<PnbDrivingObservationFormEntity>> getPnbDrivingForm(String cookie, int formId) async {
    try {
      final httpResponse = await _pnbApi.getPnbDrivingForm(cookie);

      final pnbPlaces = httpResponse.data;

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(pnbPlaces);
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
  Future<DataState<PnbDrivingObservationEntity>> getPnbDrivingFormList(String cookie) async {
    try {
      final httpResponse = await _pnbApi.getPnbDrivingList(cookie);

      final pnbPlaces = httpResponse.data;

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(pnbPlaces);
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
  Future<DataState<PnbWorkObservationFormEntity>> getPnbWorkForm(String cookie) async {
    try {
      final httpResponse = await _pnbApi.getPnbWorkForm(cookie);

      final pnbPlaces = httpResponse.data;

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(pnbPlaces);
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
  Future<DataState<PnbWorkObservationEntity>> getPnbWorkFormList(String cookie) async {
    try {
      final httpResponse = await _pnbApi.getPnbWorkList(cookie);

      final pnbPlaces = httpResponse.data;

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(pnbPlaces);
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
  Future<DataState<IsSuccessResponse>> removePnbDrivingForm(int formId) async {
    try {
      final httpResponse = await _pnbApi.removePnbDriving(formId);

      final pnbPlaces = httpResponse.data;

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(pnbPlaces);
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
  Future<DataState<IsSuccessResponse>> removePnbWorkForm(int formId) async {
    try {
      final httpResponse = await _pnbApi.removePnbWork(formId);

      final pnbPlaces = httpResponse.data;

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(pnbPlaces);
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
  Future<DataState<IsSuccessResponse>> savePnbDrivingForm(Map<String, dynamic> requestBody) async {
    try {
      final httpResponse = await _pnbApi.savePnbDriving(requestBody);

      final pnbPlaces = httpResponse.data; 

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(pnbPlaces);
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
  Future<DataState<IsSuccessResponse>> savePnbWorkForm(Map<String, dynamic> requestBody) async {
    try {
      final httpResponse = await _pnbApi.savePnbWork(requestBody);

      final pnbPlaces = httpResponse.data;

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(pnbPlaces);
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

}