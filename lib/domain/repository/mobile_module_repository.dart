import 'package:hsg_loyalty/domain/entity/module/mobile_module_entity.dart';
import 'package:hsg_loyalty/domain/entity/module/mobile_module_file_entity.dart';

import '../../utils/resources/data_state.dart';

abstract class MobileModuleRepository {
  Future<DataState<List<MobileModuleEntity>>> getMobileModules();

  Future<DataState<List<MobileModuleFileEntity>>> getMobileModuleFile(int id);
}

