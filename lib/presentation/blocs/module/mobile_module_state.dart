
import 'package:hsg_loyalty/domain/entity/module/mobile_module_file_entity.dart';

import '../../../domain/entity/module/mobile_module_entity.dart';

class MobileModuleState {
  final List<MobileModuleEntity>? mobileModuleEntityList;
  final List<MobileModuleFileEntity>? mobileModuleFileEntityList;

  const MobileModuleState({this.mobileModuleEntityList, this.mobileModuleFileEntityList});
}

class MobileModuleLaunching extends MobileModuleState {}

class MobileModuleLoading extends MobileModuleState {}

class MobileModulesDone extends MobileModuleState {
  const MobileModulesDone({
    required List<MobileModuleEntity>? mobileModuleEntityList,
  }) : super(mobileModuleEntityList: mobileModuleEntityList);
}

class MobileModuleFileDone extends MobileModuleState {
  const MobileModuleFileDone(
      {required List<MobileModuleFileEntity>? mobileModuleFileEntityList})
      : super(mobileModuleFileEntityList: mobileModuleFileEntityList);
}

class MobileModuleError extends MobileModuleState {
  const MobileModuleError();
}
