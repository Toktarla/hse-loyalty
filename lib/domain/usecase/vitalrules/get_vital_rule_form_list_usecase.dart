import 'package:hsg_loyalty/domain/entity/user/profile_entity.dart';
import 'package:hsg_loyalty/domain/entity/vitalrule/user_answers_dto_entity.dart';
import 'package:hsg_loyalty/domain/entity/vitalrule/vital_rule_form_entity.dart';
import 'package:hsg_loyalty/domain/repository/profile_repository.dart';
import 'package:hsg_loyalty/domain/repository/vital_rules_repository.dart';
import 'package:hsg_loyalty/utils/resources/data_state.dart';

import '../../../utils/helpers/usecase_helper.dart';

class GetVitalRuleFormListUsecase implements UseCase<DataState<VitalRuleFormEntity>, String> {
  final VitalRulesRepository _vitalRulesRepository;

  GetVitalRuleFormListUsecase(this._vitalRulesRepository);

  @override
  Future<DataState<VitalRuleFormEntity>> call({String? params,bool getAll = true}) {
    return _vitalRulesRepository.getVitalRuleFormList(params!,getAll);
  }
}
