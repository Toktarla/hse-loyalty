import 'package:hsg_loyalty/data/model/create/isSuccessResponse.dart';
import 'package:hsg_loyalty/domain/entity/questionnaires/questionnaire_entity.dart';
import 'package:hsg_loyalty/domain/entity/questionnaires/questionnaire_form_entity.dart';

import '../../utils/resources/data_state.dart';

abstract class QuestionnaireRepository {

  Future<DataState<QuestionnaireEntity>> getQuestionnaires(String page);

  Future<DataState<QuestionnaireFormEntity>> getQuestionnaireById(String id);

  Future<DataState<IsSuccessResponse>> saveQuestionnaireAnswer(QuestionnaireFormEntity requestBody);

  // Future<DataState<IsSuccessResponse>> saveQuestionnaireAnswer(String cookie,QuestionnaireFormEntity questionnaireFormEntity);
}




