
import 'package:hsg_loyalty/data/model/create/isSuccessResponse.dart';
import 'package:hsg_loyalty/domain/entity/user/isSuccessResponse_entity.dart';
import 'package:hsg_loyalty/domain/entity/vitalrule/creation_page_entity.dart';
import 'package:hsg_loyalty/domain/entity/vitalrule/user_answers_dto_entity.dart';

import '../../utils/resources/data_state.dart';
import '../entity/vitalrule/vital_rule_form_entity.dart';

abstract class VitalRulesRepository {

  Future<DataState<IsSuccessResponse>> saveVitalRuleForm(UserAnswersDtoEntity requestBody);

  Future<DataState<IsSuccessResponse>> deleteVitalRuleForm(int formId);

  Future<DataState<VitalRuleFormEntity>> getVitalRuleFormList(String cookie,bool getAll);

  Future<DataState<UserAnswersDtoEntity>> getVitalRuleForm(String cookie, int formId);

  Future<DataState<CreationPageEntity>> getVitalRuleCreationPage(String cookie);

}
