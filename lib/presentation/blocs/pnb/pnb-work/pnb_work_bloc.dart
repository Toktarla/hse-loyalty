import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hsg_loyalty/domain/entity/pnb/pnbwork/pnb_work_observation_form_entity.dart';
import 'package:hsg_loyalty/presentation/blocs/pnb/pnb-work/pnb_work_event.dart';
import 'package:hsg_loyalty/presentation/blocs/pnb/pnb-work/pnb_work_state.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../domain/entity/pnb/pnbwork/pnb_work_observation_entity.dart';

class PnbWorkBloc extends Bloc<PnbWorkEvent, PnbWorkState> {
  final Dio _dio;
  final SharedPreferences _prefs;

  PnbWorkBloc(this._dio, this._prefs) : super(PnbWorkLaunching()) {
    on<GetPnbWorkByIdEvent>(onGetPnbWorkByIdEvent);
    on<GetPnbWorkFormsEvent>(onGetPnbWorkFormsEvent);
    on<GetPnbWorkListEvent>(onGetPnbWorkListEvent);
    on<SavePnbWorkEvent>(onSavePnbWorkEvent);
    on<DeletePnbWorkEvent>(onDeletePnbWorkEvent);
  }

  Map<String, dynamic> get _headers => <String, dynamic>{r'Cookie': _prefs.getString("authToken")};

  Future<void> onGetPnbWorkByIdEvent(GetPnbWorkByIdEvent event, Emitter<PnbWorkState> emit) async {
    emit(PnbWorkLoading());
    try {
      final response = await _dio.get('/pnb-work/get', queryParameters: {'id': event.id}, options: Options(headers: _headers));
      final jsonData = response.data;
      final PnbWorkObservationFormEntity pnbWorkForm = PnbWorkObservationFormEntity.fromJson(jsonData);

      emit(PnbWorkDone(pnbWorkList: null, pnbWorkForm: pnbWorkForm));
    } catch (error) {
      emit(PnbWorkError(error: error.toString()));
    }
  }

  Future<void> onGetPnbWorkFormsEvent(GetPnbWorkFormsEvent event, Emitter<PnbWorkState> emit) async {
    emit(PnbWorkLoading());
    try {
      final response = await _dio.get('/pnb-work/get-form', options: Options(headers: _headers));
      final jsonData = response.data;
      final PnbWorkObservationFormEntity pnbWorkForm = PnbWorkObservationFormEntity.fromJson(jsonData);

      emit(PnbWorkDone(pnbWorkList: null, pnbWorkForm: pnbWorkForm));
    } catch (error) {
      emit(PnbWorkError(error: error.toString()));
    }
  }

  Future<void> onGetPnbWorkListEvent(GetPnbWorkListEvent event, Emitter<PnbWorkState> emit) async {
    emit(PnbWorkLoading());
    try {
      final response = await _dio.get('/pnb-work/list', options: Options(headers: _headers));
      final List<dynamic> jsonList = response.data['List'];
      final List<PnbWorkObservationEntity> pnbWorkList = jsonList
          .map((json) => PnbWorkObservationEntity.fromJson(json))
          .toList();

      emit(PnbWorkDone(pnbWorkList: pnbWorkList, pnbWorkForm: null));
    } catch (error) {
      emit(PnbWorkError(error: error.toString()));
    }
  }

  Future<void> onSavePnbWorkEvent(SavePnbWorkEvent event, Emitter<PnbWorkState> emit) async {
    emit(PnbWorkLoading());
    try {
      await _dio.post('/pnb-work/save', data: event.requestBody, options: Options(headers: _headers));
      emit(SavePnbWorkDone());
    } catch (error) {
      emit(PnbWorkError(error: error.toString()));
    }
  }

  Future<void> onDeletePnbWorkEvent(DeletePnbWorkEvent event, Emitter<PnbWorkState> emit) async {
    emit(PnbWorkLoading());
    try {
      await _dio.delete('/pnb-work/remove', queryParameters: {'id': event.id}, options: Options(headers: _headers));
      emit(DeletePnbWorkDone());
    } catch (error) {
      emit(PnbWorkError(error: error.toString()));
    }
  }
}
