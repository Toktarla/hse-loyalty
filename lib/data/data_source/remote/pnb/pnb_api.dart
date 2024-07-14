import 'package:dio/dio.dart';
import 'package:hsg_loyalty/data/model/create/isSuccessResponse.dart';
import 'package:hsg_loyalty/data/model/pnb/driving/driving_observation_form_model.dart';
import 'package:hsg_loyalty/data/model/pnb/driving/driving_observation_model.dart';
import 'package:hsg_loyalty/data/model/pnb/work/place_item_model.dart';
import 'package:hsg_loyalty/data/model/pnb/work/place_model.dart';
import 'package:hsg_loyalty/data/model/pnb/work/work_observation_form_model.dart';
import 'package:hsg_loyalty/data/model/pnb/work/work_observation_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:hsg_loyalty/utils/constants/constants.dart';

part 'pnb_api.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class PnbApi {
  factory PnbApi(Dio dio, {String baseUrl}) = _PnbApi;

  // Pnb Work
  @GET("/pnb-work/list")
  Future<HttpResponse<PnbWorkObservationModel>> getPnbWorkList(@Header("Cookie") String cookie);

  @GET("/pnb-work/get-form")
  Future<HttpResponse<PnbWorkObservationFormModel>> getPnbWorkForm(@Header("Cookie") String cookie);

  @POST("/pnb-work/save")
  Future<HttpResponse<IsSuccessResponse>> savePnbWork(@Body() Map<String, dynamic> body);

  @DELETE("/pnb-work/remove")
  Future<HttpResponse<IsSuccessResponse>> removePnbWork(@Query("id") int id);

  // Pnb Driving
  @GET("/pnb-driving/list")
  Future<HttpResponse<PnbDrivingObservationModel>> getPnbDrivingList(@Header("Cookie") String cookie);

  @GET("/pnb-driving/get-form")
  Future<HttpResponse<PnbDrivingObservationFormModel>> getPnbDrivingForm(@Header("Cookie") String cookie);

  @POST("/pnb-driving/save")
  Future<HttpResponse<IsSuccessResponse>> savePnbDriving(@Body() Map<String, dynamic> body);

  @DELETE("/pnb-driving/remove")
  Future<HttpResponse<IsSuccessResponse>> removePnbDriving(@Query("id") int id);

  // Places
  @GET("/Reference/GetPlaces")
  Future<HttpResponse<List<PlaceModel>>> getAllPnbPlace();

  @GET("/Reference/GetPlaceItems")
  Future<HttpResponse<List<PlaceItemModel>>> getAllPnbPlaceItem();
}
