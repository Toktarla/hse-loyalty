import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hsg_loyalty/domain/usecase/module/get_mobile_modules_usecase.dart';
import '../../../domain/usecase/module/get_mobile_module_file_usecase.dart';
import '../../../utils/resources/data_state.dart';
import 'mobile_module_event.dart';
import 'mobile_module_state.dart';

class MobileModuleBloc extends Bloc<MobileModuleEvent, MobileModuleState> {
  final GetMobileModulesUseCase _getMobileModulesUseCase;
  final GetMobileModuleFileUseCase _getMobileModuleFileUseCase;


  MobileModuleBloc(this._getMobileModulesUseCase, this._getMobileModuleFileUseCase)
      : super(MobileModuleLaunching()) {
    on<GetMobileModulesEvent>(onGetMobileModulesEvent);
    on<GetMobileModuleFilesEvent>(onGetMobileModuleFileEvent);
  }

  onGetMobileModulesEvent(GetMobileModulesEvent event,emit) async {
    emit(MobileModuleLoading());

    final dataState = await _getMobileModulesUseCase.call();
    if (dataState is DataSuccess && dataState.data != null) {
      emit(MobileModulesDone(mobileModuleEntityList: dataState.data));
    }
    else {
      print("GetMobileModulesEvent Error message : ${dataState.error!.message}");
      emit(const MobileModuleError());
    }
  }
  onGetMobileModuleFileEvent(GetMobileModuleFilesEvent event,emit) async {
    emit(MobileModuleLoading());

    final dataState = await _getMobileModuleFileUseCase.call(params: event.id);
    if (dataState is DataSuccess && dataState.data != null) {

      emit(MobileModuleFileDone(mobileModuleFileEntityList: dataState.data));

    }
    else {
      print("GetMobileModuleByIdEvent Error message : ${dataState.error!.message}");
      emit(const MobileModuleError());
    }
  }



}
