import 'package:dio/dio.dart';
import 'package:hsg_loyalty/data/model/user/profile_model.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../utils/constants/constants.dart';
import '../../../model/create/isSuccessResponse_model.dart';

part 'profile_api.g.dart';


@RestApi(baseUrl: baseUrl)
abstract class ProfileApi {
  factory ProfileApi(Dio dio) = _ProfileApi;

  @POST("mobile-account/auth")
  Future<HttpResponse<IsSuccessResponseModel>> login(@Body() Map<String,String> requestBody);

  @GET("dashboard/profile/info")
  Future<HttpResponse<ProfileModel>> getProfile(@Header("Cookie") String cookie);
}