import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hsg_loyalty/domain/usecase/user/get_profile_usecase.dart';
import 'package:hsg_loyalty/domain/usecase/user/login_usecase.dart';
import 'package:hsg_loyalty/presentation/blocs/profile/profile_event.dart';
import 'package:hsg_loyalty/presentation/blocs/profile/profile_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/resources/data_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfileUseCase _getProfileUseCase;
  final LoginUseCase _loginUseCase;
  final SharedPreferences _prefs;

  ProfileBloc(this._getProfileUseCase, this._loginUseCase, this._prefs)
      : super(const ProfileState()) {
    on<GetProfileEvent>(onGetProfileEvent);
    on<LoginEvent>(onLoginEvent);
    on<LogOutEvent>(logOutEvent);
  }

  logOutEvent(LogOutEvent event, Emitter<ProfileState> emit,){
    _prefs.remove("authToken");
    _prefs.remove("userOrganization");
    _prefs.remove("userOrganizationId");
    emit(ProfileLaunching());
  }

  void onGetProfileEvent(GetProfileEvent event, Emitter<ProfileState> emit) async {
    final String? cookie = _prefs.getString("authToken");
    if(cookie != null){
      emit(ProfileLoading());
      final dataState = await _getProfileUseCase.call(params: cookie);
      if (dataState is DataSuccess && dataState.data != null) {
        emit(ProfileDone(profileEntity: dataState.data));
      } else {
        print("GetProfileEvent Error message : ${dataState.error!.message}");
        emit(const ProfileError());
      }
    }
  }

  void onLoginEvent(LoginEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());

    final dataState = await _loginUseCase.call(params: event.requestBody);
    if (dataState is DataSuccess && dataState.data != null) {
      await _prefs.setString("authToken", dataState.data!);
      emit(const ProfileExists());
    }
    else {
      print("LoginEvent Error message : ${dataState.error!.message}");
      emit(const ProfileDoesNotExists());
    }
  }
}
