import 'package:hsg_loyalty/domain/entity/user/profile_entity.dart';
import 'package:hsg_loyalty/domain/entity/vitalrule/user_answers_dto_entity.dart';
import 'package:hsg_loyalty/domain/repository/profile_repository.dart';
import 'package:hsg_loyalty/domain/repository/vital_rules_repository.dart';
import 'package:hsg_loyalty/utils/resources/data_state.dart';

import '../../../utils/helpers/usecase_helper.dart';

class GetVitalRuleFormUsecase implements UseCase<DataState<UserAnswersDtoEntity>, Map<String,dynamic>> {
  final VitalRulesRepository _vitalRulesRepository;

  GetVitalRuleFormUsecase(this._vitalRulesRepository);

  @override
  Future<DataState<UserAnswersDtoEntity>> call({Map<String,dynamic>? params}) {
    return _vitalRulesRepository.getVitalRuleForm(params!['cookie'],params['formId']);
  }

}
