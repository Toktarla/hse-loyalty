import '../../../utils/resources/data_state.dart';
import '../../../utils/helpers/usecase_helper.dart';
import '../../entity/questionnaires/questionnaire_entity.dart';
import '../../repository/questionnaire_repository.dart';

class GetQuestionnairesUseCase extends UseCase<DataState<QuestionnaireEntity>, int> {
  final QuestionnaireRepository _questionnaireRepository;

  GetQuestionnairesUseCase(this._questionnaireRepository);

  @override
  Future<DataState<QuestionnaireEntity>> call({int? params}) {
    if (params == null) {
      throw ArgumentError('Params cannot be null');
    }
    return _questionnaireRepository.getQuestionnaires(params.toString());
  }


}