import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hsg_loyalty/domain/usecase/questionnaires/get_questionnaire_byId_usecase.dart';
import 'package:hsg_loyalty/domain/usecase/questionnaires/get_questionnaires_usecase.dart';
import 'package:hsg_loyalty/presentation/blocs/questionnaire/questionnaire_event.dart';
import 'package:hsg_loyalty/presentation/blocs/questionnaire/questionnaire_state.dart';

import '../../../domain/usecase/questionnaires/save_questionnaire_answer_usecase.dart';
import '../../../utils/resources/data_state.dart';

class QuestionnaireBloc extends Bloc<QuestionnaireEvent, QuestionnaireState> {
  final GetQuestionnairesUseCase _getQuestionnairesUseCase;
  final GetQuestionnaireByIdUseCase _getQuestionnaireByIdUseCase;
  final SaveQuestionnaireAnswerUseCase _saveQuestionnaireAnswerUseCase;


  QuestionnaireBloc(this._getQuestionnairesUseCase, this._getQuestionnaireByIdUseCase, this._saveQuestionnaireAnswerUseCase)
      : super(QuestionnaireLaunching()) {
    on<GetQuestionnairesEvent>(onGetQuestionnairesEvent);
    on<GetQuestionnaireByIdEvent>(onGetQuestionnaireByIdEvent);
    on<SaveQuestionnaireEvent>(onSaveQuestionnaireEvent);
  }

  onGetQuestionnairesEvent(GetQuestionnairesEvent event,emit) async {
    emit(QuestionnaireLoading());

    final dataState = await _getQuestionnairesUseCase.call(params: event.page);
    if (dataState is DataSuccess && dataState.data != null) {
      emit(QuestionnairesDone(questionnaireEntity: dataState.data));
    }
    else {
      print("GetQuestionnairesEvent Error message : ${dataState.error!.message}");
      emit(const QuestionnaireError());
    }
  }
  onGetQuestionnaireByIdEvent(GetQuestionnaireByIdEvent event,emit) async {
    emit(QuestionnaireLoading());

    final dataState = await _getQuestionnaireByIdUseCase.call(params: event.id);
    if (dataState is DataSuccess && dataState.data != null) {

      emit(QuestionnaireByIdDone(questionnaireFormEntity: dataState.data));

    }
    else {
      print("GetQuestionnaireByIdEvent Error message : ${dataState.error!.message}");
      emit(const QuestionnaireError());
    }
  }
  onSaveQuestionnaireEvent(SaveQuestionnaireEvent event,emit) async {
    final dataState = await _saveQuestionnaireAnswerUseCase.call(params: event.requestBody);
    if (dataState is DataSuccess && dataState.data != null) {
      emit(SaveQuestionnaireDone());
    }
    else {
      print("SaveQuestionnaireEvent  Error message : ${dataState.error!.message}");
      emit(const QuestionnaireError());
    }
  }


}
