import 'package:hsg_loyalty/domain/entity/user/isSuccessResponse_entity.dart';
import 'package:hsg_loyalty/domain/entity/user/profile_entity.dart';
import 'package:hsg_loyalty/domain/entity/vitalrule/user_answers_dto_entity.dart';
import 'package:hsg_loyalty/domain/repository/profile_repository.dart';
import 'package:hsg_loyalty/domain/repository/vital_rules_repository.dart';
import 'package:hsg_loyalty/utils/resources/data_state.dart';

import '../../../data/model/create/isSuccessResponse.dart';
import '../../../utils/helpers/usecase_helper.dart';

class SaveVitalRuleFormUsecase implements UseCase<DataState<IsSuccessResponse>, UserAnswersDtoEntity> {
  final VitalRulesRepository _vitalRulesRepository;

  SaveVitalRuleFormUsecase(this._vitalRulesRepository);

  @override
  Future<DataState<IsSuccessResponse>> call({UserAnswersDtoEntity? params}) {
    return _vitalRulesRepository.saveVitalRuleForm(params!);
  }
}
