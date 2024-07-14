
import 'package:hsg_loyalty/data/model/create/isSuccessResponse.dart';
import 'package:hsg_loyalty/domain/entity/vitalrule/creation_page_entity.dart';
import 'package:hsg_loyalty/domain/entity/vitalrule/user_answers_dto_entity.dart';
import 'package:hsg_loyalty/domain/entity/vitalrule/vital_rule_form_entity.dart';

class VitalRulesState {
  final VitalRuleFormEntity? vitalRulesEntity;
  final UserAnswersDtoEntity? userAnswersDtoEntity;
  final CreationPageEntity? creationPageEntity;
  const VitalRulesState({
    this.creationPageEntity,
    this.vitalRulesEntity,
    this.userAnswersDtoEntity,
  });
}

class VitalRulesLaunching extends VitalRulesState {}

class VitalRulesLoading extends VitalRulesState {}

class VitalRulesDone extends VitalRulesState {
  const VitalRulesDone({
    required VitalRuleFormEntity? vitalRulesEntity,
  }) : super(vitalRulesEntity: vitalRulesEntity);
}

class SaveVitalRulesDone extends VitalRulesState {
  const SaveVitalRulesDone();
}

class VitalRuleDone extends VitalRulesState {
  const VitalRuleDone({
    required UserAnswersDtoEntity? userAnswerDtoEntity,
  }) : super(userAnswersDtoEntity: userAnswerDtoEntity);
}

class CreationPageVitalRuleDone extends VitalRulesState {
  const CreationPageVitalRuleDone({
    required CreationPageEntity? creationPageEntity,
  }) : super(creationPageEntity: creationPageEntity);
}

class VitalRuleDeleted extends VitalRulesState {
}


class VitalRulesError extends VitalRulesState {
  const VitalRulesError();
}
