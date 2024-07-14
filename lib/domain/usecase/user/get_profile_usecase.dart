import 'package:hsg_loyalty/domain/entity/user/profile_entity.dart';
import 'package:hsg_loyalty/domain/repository/profile_repository.dart';
import 'package:hsg_loyalty/utils/resources/data_state.dart';

import '../../../utils/helpers/usecase_helper.dart';

class GetProfileUseCase implements UseCase<DataState<ProfileEntity>, String> {
  final ProfileRepository _profileRepository;

  GetProfileUseCase(this._profileRepository);

  @override
  Future<DataState<ProfileEntity>> call({String? params}) {
    return _profileRepository.getProfile(params!);
  }
}
