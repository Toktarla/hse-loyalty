import 'package:hsg_loyalty/domain/entity/user/profile_entity.dart';
import 'package:hsg_loyalty/utils/resources/data_state.dart';

abstract class ProfileRepository {

    Future<DataState<String>> login(Map<String,String> requestBody);

    Future<DataState<ProfileEntity>> getProfile(String cookie);

}