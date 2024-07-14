import 'package:hsg_loyalty/domain/entity/questionnaires/questionnaire_form_entity.dart';

import '../../../domain/entity/questionnaires/questionnaire_entity.dart';

class QuestionnaireState {
  final QuestionnaireEntity? questionnaireEntity;
  final QuestionnaireFormEntity? questionnaireFormEntity;

  const QuestionnaireState(
      {this.questionnaireEntity, this.questionnaireFormEntity});
}

class QuestionnaireLaunching extends QuestionnaireState {}

class QuestionnaireLoading extends QuestionnaireState {}

class QuestionnairesDone extends QuestionnaireState {
  const QuestionnairesDone({
    required QuestionnaireEntity? questionnaireEntity,
  }) : super(questionnaireEntity: questionnaireEntity);
}

class QuestionnaireByIdDone extends QuestionnaireState {
  const QuestionnaireByIdDone(
      {required QuestionnaireFormEntity? questionnaireFormEntity})
      : super(questionnaireFormEntity: questionnaireFormEntity);
}

class SaveQuestionnaireDone extends QuestionnaireState {

}

class QuestionnaireError extends QuestionnaireState {
  const QuestionnaireError();
}
