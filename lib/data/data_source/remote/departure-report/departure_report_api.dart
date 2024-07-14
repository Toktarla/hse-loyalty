import 'package:dio/dio.dart';
import 'package:hsg_loyalty/data/model/departure-report/departure_report_answer_model.dart';
import 'package:hsg_loyalty/data/model/departure-report/departure_report_model.dart';
import 'package:hsg_loyalty/utils/constants/constants.dart';
import 'package:retrofit/retrofit.dart';
import '../../../model/create/isSuccessResponse.dart';
part 'departure_report_api.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class DepartureReportApi {
  factory DepartureReportApi(Dio dio) = _DepartureReportApi;

  @PUT("departure-report/save?IsMobile=true")
  Future<HttpResponse<IsSuccessResponse>> saveDepartureReportForm(@Body() DepartureReportModel departureReportModel,@Header("Cookie") String cookie);

  @DELETE("departure-report/delete-data?IsMobile=true")
  Future<HttpResponse<IsSuccessResponse>> deleteDepartureReportForm(@Query("id") int departureFormId, @Header("Cookie") String cookie);

  @GET("departure-report/index?IsMobile=true&getAll=false")
  Future<HttpResponse<DepartureReportAnswerModel>> getDepartureReportFormListForUser(@Header("Cookie") String cookie);

  @GET("departure-report/index?IsMobile=true&getAll=true")
  Future<HttpResponse<DepartureReportAnswerModel>> getDepartureReportFormList(@Header("Cookie") String cookie);

  @GET("departure-report/creation-page?IsMobile=true")
  Future<HttpResponse<DepartureReportModel>> getDepartureReportForm(@Header("Cookie") String cookie, @Path("id") int userId);

}
