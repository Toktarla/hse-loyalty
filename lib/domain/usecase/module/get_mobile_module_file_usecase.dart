import 'package:hsg_loyalty/domain/entity/module/mobile_module_file_entity.dart';

import '../../../utils/resources/data_state.dart';
import '../../../utils/helpers/usecase_helper.dart';
import '../../repository/mobile_module_repository.dart';

class GetMobileModuleFileUseCase implements UseCase<DataState<List<MobileModuleFileEntity>>,int> {
  final MobileModuleRepository _mobileModuleRepository;

  const GetMobileModuleFileUseCase(this._mobileModuleRepository);

  @override
  Future<DataState<List<MobileModuleFileEntity>>> call({int? params}) {
    return _mobileModuleRepository.getMobileModuleFile(params!);
  }
}