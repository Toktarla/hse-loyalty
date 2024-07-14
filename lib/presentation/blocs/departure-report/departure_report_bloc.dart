import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hsg_loyalty/domain/usecase/departure-report/get_departure_report_form_list_for_user_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../domain/usecase/departure-report/delete_departure_report_form_usecase.dart';
import '../../../domain/usecase/departure-report/get_departure_report_form_list_usecase.dart';
import '../../../domain/usecase/departure-report/get_departure_report_form_usecase.dart';
import '../../../domain/usecase/departure-report/save_departure_report_form_usecase.dart';
import '../../../utils/resources/data_state.dart';
import 'departure_report_event.dart';
import 'departure_report_state.dart';

class DepartureReportBloc extends Bloc<DepartureReportEvent, DepartureReportState> {
  final GetDepartureReportFormListUsecase _getDepartureReportFormListUsecase;
  final GetDepartureReportFormUsecase _getDepartureReportFormUsecase;
  final GetDepartureReportFormListForUserUsecase _getDepartureReportFormListForUserUsecase;
  final DeleteDepartureReportFormUsecase _deleteDepartureReportFormUsecase;
  final SaveDepartureReportFormUsecase _saveDepartureReportFormUsecase;
  final SharedPreferences _prefs;

  DepartureReportBloc(
      this._getDepartureReportFormListForUserUsecase,
      this._deleteDepartureReportFormUsecase,
      this._saveDepartureReportFormUsecase,
      this._getDepartureReportFormUsecase,
      this._getDepartureReportFormListUsecase,
      this._prefs
      )
      : super(const DepartureReportState()) {
    on<GetDepartureReportEvent>(onGetDepartureReportEvent);
    on<GetDepartureReportForUserEvent>(onGetDepartureReportListForUserEvent);
    on<GetDepartureReportListEvent>(onGetDepartureReportFormListEvent);
    on<SaveDepartureReportEvent>(onSaveDepartureReportFormEvent);
    on<DeleteDepartureReportEvent>(onDeleteDepartureReportEvent);
  }

  void onGetDepartureReportEvent(GetDepartureReportEvent event, Emitter<DepartureReportState> emit) async {
    final String? cookie = _prefs.getString("authToken");

    if (cookie != null){
      emit(DepartureReportLoading());
      final dataState = await _getDepartureReportFormUsecase.call(params: {
        "userId" : event.userId,
        "cookie" : cookie,
      });

      if (dataState is DataSuccess && dataState.data != null) {
        emit(DepartureReportDone(departureReportEntity: dataState.data, departureReportAnswerEntity: null));
      } else {
        print("GetDepartureReportFormEvent Error message : ${dataState.error!.message}");
        emit(const DepartureReportError());
      }
    }
  }

  void onGetDepartureReportFormListEvent(GetDepartureReportListEvent event, Emitter<DepartureReportState> emit) async {
    final String? cookie = _prefs.getString("authToken");

    if(cookie != null) {

      emit(DepartureReportLoading());
      final dataState = await _getDepartureReportFormListUsecase.call(params: cookie);
      if (dataState is DataSuccess && dataState.data != null) {
        emit(DepartureReportDone(departureReportEntity: null, departureReportAnswerEntity: dataState.data));
      } else {
        print("GetDepartureReportFormListEvent Error message : ${dataState.error!.message}");
        emit(const DepartureReportError());
      }
    }
  }

  void onGetDepartureReportListForUserEvent(GetDepartureReportForUserEvent event, Emitter<DepartureReportState> emit) async {
    final String? cookie = _prefs.getString("authToken");

    if(cookie != null) {

      emit(DepartureReportLoading());
      final dataState = await _getDepartureReportFormListForUserUsecase.call(params: cookie);
      if (dataState is DataSuccess && dataState.data != null) {
        emit(DepartureReportDone(departureReportEntity: null, departureReportAnswerEntity: dataState.data));
      } else {
        print("GetDepartureReportFormListEvent Error message : ${dataState.error!.message}");
        emit(const DepartureReportError());
      }
    }
  }

  void onDeleteDepartureReportEvent(DeleteDepartureReportEvent event, Emitter<DepartureReportState> emit) async {

    final String? cookie = _prefs.getString("authToken");

    if(cookie != null) {

      emit(DepartureReportLoading());
      final dataState = await _deleteDepartureReportFormUsecase.call(params: {
        "cookie": cookie,
        "departureReportId": event.formId
      });

    if (dataState is DataSuccess && dataState.data != null) {
      emit(DepartureReportDeleted());
    } else {
      print("DeleteDepartureReportFormEvent Error message : ${dataState.error!.message}");
      emit(const DepartureReportError());
    }
  }
  }

  void onSaveDepartureReportFormEvent(SaveDepartureReportEvent event, Emitter<DepartureReportState> emit) async {
    emit(DepartureReportLoading());
    final dataState = await _saveDepartureReportFormUsecase.call(params: event.requestBody);
    if (dataState is DataSuccess && dataState.data != null) {
      emit(SaveDepartureReportDone());
    } else {
      print(dataState.error!.error);
      print("SaveDepartureReportEvent Error message : ${dataState.error!.message}");
      emit(const DepartureReportError());
    }
  }
}
