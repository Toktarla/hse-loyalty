import 'package:dio/dio.dart';
import 'package:hsg_loyalty/utils/constants/constants.dart';
import 'package:retrofit/retrofit.dart';
import '../../../model/module/mobile_module_file_model.dart';
import '../../../model/module/mobile_module_model.dart';

part 'mobile_module_api.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class MobileModuleApi {
  factory MobileModuleApi(Dio dio, {String baseUrl}) = _MobileModuleApi;

  @GET("mobile-modules/get-all")
  Future<HttpResponse<List<MobileModuleModel>>> getMobileModules();

  @GET("mobile-module-files/get")
  Future<HttpResponse<List<MobileModuleFileModel>>> getMobileModuleFile(@Query("mobileModuleId") int id);
}
