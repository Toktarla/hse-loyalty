import 'package:dio/dio.dart';
import 'package:hsg_loyalty/utils/constants/constants.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../../../model/create/create_qorgay_model.dart';
import '../../../model/create/departament_model.dart';
import '../../../model/create/isSuccessResponse.dart';
import '../../../model/create/observation_category_model.dart';
import '../../../model/create/observation_type_model.dart';
import '../../../model/create/organization_model.dart';
import '../../../model/list/qorgay_model.dart';

part 'qorgay_api.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class QorgayApi {
  factory QorgayApi(Dio dio) = _QorgayApi;

  @POST("korgau/createmobile")
  Future<HttpResponse<IsSuccessResponse>> addQorgay(@Body() CreateQorgayModel createQorgayBody);

  @GET("korgau/GetAllKorgaus")
  Future<HttpResponse<List<QorgayModel>>> getQorgayList(@Header("Cookie") String cookie);

  @GET("korgau/GetKorgausByUserId")
  Future<HttpResponse<List<QorgayModel>>> getQorgaysByUserId(@Query("userId") int userId,@Header("Cookie") String cookie);

  @GET("DictKorgauObservationType/GetAll")
  Future<HttpResponse<List<ObservationTypeModel>>> getObservationTypes();

  @GET("Reference/GetOrganizations")
  Future<HttpResponse<List<OrganizationModel>>> getOrganizations();

  @GET("Reference/GetOrgDepartments/{org_id}")
  Future<HttpResponse<List<DepartmentModel>>> getDepartments(@Path("org_id") int organizationId);

  @GET("korgau/GetObservationCategories")
  Future<HttpResponse<List<ObservationCategoryModel>>> getObservationCategories();
}
