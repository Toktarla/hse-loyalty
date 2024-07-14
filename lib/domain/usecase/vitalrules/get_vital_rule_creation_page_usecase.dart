import 'package:hsg_loyalty/domain/entity/vitalrule/creation_page_entity.dart';
import 'package:hsg_loyalty/domain/entity/vitalrule/user_answers_dto_entity.dart';
import 'package:hsg_loyalty/domain/entity/vitalrule/vital_rule_form_entity.dart';
import 'package:hsg_loyalty/domain/repository/vital_rules_repository.dart';
import 'package:hsg_loyalty/utils/resources/data_state.dart';

import '../../../utils/helpers/usecase_helper.dart';

class GetVitalRuleCreationPageUsecase implements UseCase<DataState<CreationPageEntity>, String> {
  final VitalRulesRepository _vitalRulesRepository;

  GetVitalRuleCreationPageUsecase(this._vitalRulesRepository);

  @override
  Future<DataState<CreationPageEntity>> call({String? params}) {
    return _vitalRulesRepository.getVitalRuleCreationPage(params!);
  }
}
