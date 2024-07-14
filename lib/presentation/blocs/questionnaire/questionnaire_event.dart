import '../../../domain/entity/questionnaires/questionnaire_form_entity.dart';

abstract class QuestionnaireEvent {
  const QuestionnaireEvent();
}

class GetQuestionnairesEvent extends QuestionnaireEvent {
  final int page;
  const GetQuestionnairesEvent(this.page);
}

class GetQuestionnaireByIdEvent extends QuestionnaireEvent {
  final String id;
  const GetQuestionnaireByIdEvent(this.id);
}

class SaveQuestionnaireEvent extends QuestionnaireEvent {
  QuestionnaireFormEntity requestBody;
  SaveQuestionnaireEvent(this.requestBody);
}
