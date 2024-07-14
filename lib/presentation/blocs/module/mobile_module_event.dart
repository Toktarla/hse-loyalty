abstract class MobileModuleEvent {
  const MobileModuleEvent();
}

class GetMobileModulesEvent extends MobileModuleEvent {
  const GetMobileModulesEvent();
}

class GetMobileModuleFilesEvent extends MobileModuleEvent {
  final int id;
  const GetMobileModuleFilesEvent(this.id);
}

