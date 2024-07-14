import '../../../utils/resources/data_state.dart';
import '../../../utils/helpers/usecase_helper.dart';
import '../../entity/questionnaires/questionnaire_form_entity.dart';
import '../../repository/questionnaire_repository.dart';

class GetQuestionnaireByIdUseCase extends UseCase<DataState<QuestionnaireFormEntity>, String> {
  final QuestionnaireRepository _questionnaireRepository;

  GetQuestionnaireByIdUseCase(this._questionnaireRepository);

  @override
  Future<DataState<QuestionnaireFormEntity>> call({String? params}) {
    if (params == null) {
      throw ArgumentError('ID cannot be null');
    }
    return _questionnaireRepository.getQuestionnaireById(params);
  }
}