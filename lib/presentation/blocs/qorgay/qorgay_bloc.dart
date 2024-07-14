import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hsg_loyalty/domain/usecase/qorgay/add_qorgay_usecase.dart';
import 'package:hsg_loyalty/domain/usecase/qorgay/get_departaments_usecase.dart';
import 'package:hsg_loyalty/domain/usecase/qorgay/get_observation_categories_usecase.dart';
import 'package:hsg_loyalty/domain/usecase/qorgay/get_observation_types_usecase.dart';
import 'package:hsg_loyalty/domain/usecase/qorgay/get_organizations_usecase.dart';
import 'package:hsg_loyalty/domain/usecase/qorgay/get_qorgay_list_usecase.dart';
import 'package:hsg_loyalty/domain/usecase/qorgay/get_qorgays_by_userid_usercase.dart';
import 'package:hsg_loyalty/presentation/blocs/qorgay/qorgay_event.dart';
import 'package:hsg_loyalty/presentation/blocs/qorgay/qorgay_state.dart';
import '../../../utils/resources/data_state.dart';

class QorgayBloc extends Bloc<QorgayEvent, QorgayState> {
  final AddQorgayUseCase _addQorgayUseCase;
  final GetDepartamentsUseCase _getDepartamentsUseCase;
  final GetObservationCategoriesUseCase _getObservationCategoriesUseCase;
  final GetObservationTypesUseCase _getObservationTypesUseCase;
  final GetOrganizationsUseCase _getOrganizationsUseCase;
  final GetQorgayListUseCase _getQorgayListUseCase;
  final GetQorgaysByUseridUsercase _getQorgaysByUseridUsercase;

  QorgayBloc(
      this._addQorgayUseCase,
      this._getQorgayListUseCase,
      this._getOrganizationsUseCase,
      this._getObservationTypesUseCase,
      this._getObservationCategoriesUseCase,
      this._getDepartamentsUseCase,
      this._getQorgaysByUseridUsercase)
      : super(QorgayLaunching()) {
    on<AddQorgayEvent>(addQorgayEvent);
    on<GetOrgDepartmentsEvent>(getOrgDepartaments);
    on<GetObservationCategoriesEvent>(getObservationCategoriesEvent);
    on<GetObservationTypesEvent>(getObservationTypesEvent);
    on<GetOrganizationsEvent>(getOrganizationsEvent);
    on<GetQorgausByPhoneIdEvent>(getQorgayListEvent);
    on<GetQorgausByUseridEvent>(getQorgaysByUseridEvent);
  }


  addQorgayEvent(AddQorgayEvent event, Emitter<QorgayState> emit) async {
    emit(QorgayLoading());

    final dataState = await _addQorgayUseCase.call(params: event.requestBody);

    if (dataState is DataSuccess && dataState.data != null) {
      emit(AddQorgayDone());
    } else {
      emit(const QorgayError());
    }
  }

  Future<void> getOrgDepartaments(GetOrgDepartmentsEvent event, Emitter<QorgayState> emit) async {
    emit(QorgayLoading());
    final dataState = await _getDepartamentsUseCase.call(params: event.orgId);
    if (dataState is DataSuccess && dataState.data != null) {
      emit(DepartmentsDone(departamentList: dataState.data));
    } else {
      emit(const QorgayError());
    }
  }

  Future<void> getObservationCategoriesEvent(GetObservationCategoriesEvent event, Emitter<QorgayState> emit) async {
    emit(QorgayLoading());

    final dataState = await _getObservationCategoriesUseCase.call();
    if (dataState is DataSuccess && dataState.data != null) {
      emit(ObservationCategoriesDone(observationCategoryEntityList: dataState.data));
    } else {
      emit(const QorgayError());
    }
  }

  Future<void> getObservationTypesEvent(GetObservationTypesEvent event, Emitter<QorgayState> emit) async {
    emit(QorgayLoading());
    final dataState = await _getObservationTypesUseCase.call();
    if (dataState is DataSuccess && dataState.data != null) {
      emit(ObservationTypesDone(observationTypeEntityList: dataState.data));
    } else {
      emit(const QorgayError());
    }
  }

  Future<void> getOrganizationsEvent(GetOrganizationsEvent event, Emitter<QorgayState> emit) async {
    emit(QorgayLoading());

    final dataState = await _getOrganizationsUseCase.call();
    if (dataState is DataSuccess && dataState.data != null) {
      emit(OrganizationsDone(organizationList: dataState.data));
    } else {
      emit(const QorgayError());
    }
  }

  Future<void> getQorgayListEvent(GetQorgausByPhoneIdEvent event, Emitter<QorgayState> emit) async {
    emit(QorgayLoading());

    final dataState = await _getQorgayListUseCase.call();
    final observationTypeDataState = await _getObservationTypesUseCase.call();

    if (dataState is DataSuccess && dataState.data != null && observationTypeDataState is DataSuccess && observationTypeDataState.data != null) {
      emit(QorgayDone(
          qorgayEntityList: dataState.data,
          observationTypeEntityList :  observationTypeDataState.data
      ));
    } else {
      emit(const QorgayError());
    }
  }

  Future<void> getQorgaysByUseridEvent(GetQorgausByUseridEvent event, Emitter<QorgayState> emit) async {
    emit(QorgayLoading());

    final dataState = await _getQorgaysByUseridUsercase.call(params: event.userId);
    final observationTypeDataState = await _getObservationTypesUseCase.call();

    if (dataState is DataSuccess && dataState.data != null && observationTypeDataState is DataSuccess && observationTypeDataState.data != null) {
      emit(QorgaysForUserIdDone(
          qorgayEntityList: dataState.data,
          observationTypeEntityList :  observationTypeDataState.data
      ));
    } else {
      emit(const QorgayError());
    }
  }



}
