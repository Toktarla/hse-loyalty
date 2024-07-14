import 'package:hsg_loyalty/domain/entity/vitalrule/user_answers_dto_entity.dart';

abstract class VitalRulesEvent {
  const VitalRulesEvent();
}

class GetVitalRuleFormListEvent extends VitalRulesEvent {
  final bool getAll;
  GetVitalRuleFormListEvent(this.getAll);
}

class GetVitalRuleFormEvent extends VitalRulesEvent {
  final int formId;
  GetVitalRuleFormEvent(this.formId);
}

class GetVitalRuleCreationPageEvent extends VitalRulesEvent {
  GetVitalRuleCreationPageEvent();
}

class SaveVitalRuleFormEvent extends VitalRulesEvent {
  final UserAnswersDtoEntity requestBody;
  SaveVitalRuleFormEvent(this.requestBody);
}

class DeleteVitalRuleFormEvent extends VitalRulesEvent {
  final int formId;
  DeleteVitalRuleFormEvent(this.formId);
}