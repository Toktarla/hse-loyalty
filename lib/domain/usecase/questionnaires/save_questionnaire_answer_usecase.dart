import '../../../data/model/create/isSuccessResponse.dart';
import '../../../utils/resources/data_state.dart';
import '../../../utils/helpers/usecase_helper.dart';
import '../../entity/questionnaires/questionnaire_form_entity.dart';
import '../../repository/questionnaire_repository.dart';

class SaveQuestionnaireAnswerUseCase extends UseCase<DataState<IsSuccessResponse>, QuestionnaireFormEntity> {
  final QuestionnaireRepository _questionnaireRepository;

  SaveQuestionnaireAnswerUseCase(this._questionnaireRepository);

  @override
  Future<DataState<IsSuccessResponse>> call({QuestionnaireFormEntity? params}) {
    if (params == null) {
      throw ArgumentError('Params cannot be null');
    }

    return _questionnaireRepository.saveQuestionnaireAnswer(params);
  }


}