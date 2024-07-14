import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hsg_loyalty/domain/usecase/user/login_usecase.dart';
import 'package:hsg_loyalty/domain/usecase/vitalrules/delete_vital_rule_form_usecase.dart';
import 'package:hsg_loyalty/domain/usecase/vitalrules/get_vital_rule_creation_page_usecase.dart';
import 'package:hsg_loyalty/domain/usecase/vitalrules/get_vital_rule_form_list_usecase.dart';
import 'package:hsg_loyalty/domain/usecase/vitalrules/get_vital_rule_form_usecase.dart';
import 'package:hsg_loyalty/domain/usecase/vitalrules/save_vital_rule_form_usecase.dart';
import 'package:hsg_loyalty/presentation/blocs/vitalrules/vital_rules_event.dart';
import 'package:hsg_loyalty/presentation/blocs/vitalrules/vital_rules_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/resources/data_state.dart';

class VitalRulesBloc extends Bloc<VitalRulesEvent, VitalRulesState> {
  final GetVitalRuleFormListUsecase _getVitalRuleFormListUsecase;
  final GetVitalRuleFormUsecase _getVitalRuleFormUsecase;
  final DeleteVitalRuleFormUsecase _deleteVitalRuleFormUsecase;
  final SaveVitalRuleFormUsecase _saveVitalRuleFormUsecase;
  final GetVitalRuleCreationPageUsecase _getVitalRuleCreationPageUsecase;
  final SharedPreferences _prefs;

  VitalRulesBloc(
      this._deleteVitalRuleFormUsecase,
      this._saveVitalRuleFormUsecase,
      this._getVitalRuleFormUsecase,
      this._getVitalRuleFormListUsecase,
      this._prefs,
      this._getVitalRuleCreationPageUsecase
      )
      : super(const VitalRulesState()) {
    on<GetVitalRuleFormEvent>(onGetVitalRuleFormEvent);
    on<GetVitalRuleFormListEvent>(onGetVitalRuleFormListEvent);
    on<SaveVitalRuleFormEvent>(onSaveVitalRuleFormEvent);
    on<DeleteVitalRuleFormEvent>(onDeleteVitalRuleEvent);
    on<GetVitalRuleCreationPageEvent>(onGetVitalRuleCreationPage);

  }

  void onGetVitalRuleFormEvent(GetVitalRuleFormEvent event, Emitter<VitalRulesState> emit) async {
    final String? cookie = _prefs.getString("authToken");

    if (cookie != null){
      emit(VitalRulesLoading());
      final dataState = await _getVitalRuleFormUsecase.call(params: {
        "formId" : event.formId,
        "cookie" : cookie,
      });

      print("!!!!!!!!!!!!! : ${dataState.data}");

      if (dataState is DataSuccess && dataState.data != null) {
        emit(VitalRuleDone(userAnswerDtoEntity: dataState.data));
      } else {
        print("GetVitalRuleFormEvent Error message : ${dataState.error!.message}");
        emit(const VitalRulesError());
      }
    }
  }

  void onGetVitalRuleCreationPage(GetVitalRuleCreationPageEvent event, Emitter<VitalRulesState> emit) async {
    final String? cookie = _prefs.getString("authToken");

    if (cookie != null){
      emit(VitalRulesLoading());
      final dataState = await _getVitalRuleCreationPageUsecase.call(params: cookie);

      if (dataState is DataSuccess && dataState.data != null) {
        emit(CreationPageVitalRuleDone(creationPageEntity: dataState.data));
      } else {
        print("GetVitalRuleFormEvent Error message : ${dataState.error!.message}");
        emit(const VitalRulesError());
      }
    }
  }

  void onGetVitalRuleFormListEvent(GetVitalRuleFormListEvent event, Emitter<VitalRulesState> emit) async {
    final String? cookie = _prefs.getString("authToken");

    if (cookie != null) {

      emit(VitalRulesLoading());
      final dataState = await _getVitalRuleFormListUsecase.call(params: cookie,getAll: event.getAll);
      if (dataState is DataSuccess && dataState.data != null) {
        emit(VitalRulesDone(vitalRulesEntity: dataState.data));
      } else {
        print("GetVitalRuleFormListEvent Error message : ${dataState.error!.message}");
        emit(const VitalRulesError());
      }
    }
  }

  void onDeleteVitalRuleEvent(DeleteVitalRuleFormEvent event, Emitter<VitalRulesState> emit) async {

    emit(VitalRulesLoading());
    final dataState = await _deleteVitalRuleFormUsecase.call(params: event.formId);
    if (dataState is DataSuccess && dataState.data != null) {
      emit(VitalRuleDeleted());
    } else {
      print("DeleteVitalRuleFormEvent Error message : ${dataState.error!.message}");
      emit(const VitalRulesError());
    }
  }

  void onSaveVitalRuleFormEvent(SaveVitalRuleFormEvent event, Emitter<VitalRulesState> emit) async {
      emit(VitalRulesLoading());
      final dataState = await _saveVitalRuleFormUsecase.call(params: event.requestBody);
      if (dataState is DataSuccess && dataState.data != null) {
        emit(const SaveVitalRulesDone());
      } else {
        print(dataState.error);
        print("SaveVitalRuleFormEvent Error message : ${dataState.error!.message}");
        emit(const VitalRulesError());
      }
  }
}
