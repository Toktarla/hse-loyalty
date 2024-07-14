
import 'package:hsg_loyalty/domain/repository/mobile_module_repository.dart';
import 'package:hsg_loyalty/utils/helpers/usecase_helper.dart';

import '../../../utils/resources/data_state.dart';
import '../../entity/module/mobile_module_entity.dart';

class GetMobileModulesUseCase implements UseCase<DataState<List<MobileModuleEntity>>,void> {
  final MobileModuleRepository _mobileModuleRepository;

  const GetMobileModulesUseCase(this._mobileModuleRepository);

  @override
  Future<DataState<List<MobileModuleEntity>>> call({void params}) {
    return _mobileModuleRepository.getMobileModules();
  }

}