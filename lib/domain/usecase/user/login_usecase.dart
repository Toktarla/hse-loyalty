import 'package:hsg_loyalty/domain/repository/profile_repository.dart';
import 'package:hsg_loyalty/utils/resources/data_state.dart';

import '../../../utils/helpers/usecase_helper.dart';

class LoginUseCase implements UseCase<DataState<String>, Map<String,String>>{
  final ProfileRepository _profileRepository;

  LoginUseCase(this._profileRepository);

  @override
  Future<DataState<String>> call({Map<String, String>? params}) {
    return _profileRepository.login(params!);
  }
}