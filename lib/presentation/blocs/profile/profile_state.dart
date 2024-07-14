import 'package:hsg_loyalty/domain/entity/user/profile_entity.dart';

class ProfileState {
  final ProfileEntity? profileEntity;

  const ProfileState({
    this.profileEntity,
  });
}

class ProfileLaunching extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileDone extends ProfileState {
  const ProfileDone({
    required ProfileEntity? profileEntity,
  }) : super(profileEntity: profileEntity);
}

class ProfileExists extends ProfileState {
  const ProfileExists();
}

class ProfileDoesNotExists extends ProfileState {
  const ProfileDoesNotExists();
}

class ProfileError extends ProfileState {
  const ProfileError();
}
