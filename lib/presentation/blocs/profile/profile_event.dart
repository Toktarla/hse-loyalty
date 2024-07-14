abstract class ProfileEvent {
  const ProfileEvent();
}

class GetProfileEvent extends ProfileEvent {
  GetProfileEvent();
}

class LoginEvent extends ProfileEvent {
  final Map<String,String> requestBody;
  LoginEvent(this.requestBody);
}

class LogOutEvent extends ProfileEvent {
  LogOutEvent();
}