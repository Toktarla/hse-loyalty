import 'package:hsg_loyalty/data/model/create/isSuccessResponse.dart';
import 'package:hsg_loyalty/domain/entity/pnb/driving/pnb_driving_observation_entity.dart';
import 'package:hsg_loyalty/domain/entity/pnb/driving/pnb_driving_observation_form_entity.dart';
import 'package:hsg_loyalty/domain/entity/pnb/pnbwork/place_entity.dart';
import 'package:hsg_loyalty/domain/entity/pnb/pnbwork/place_item_entity.dart';
import 'package:hsg_loyalty/domain/entity/pnb/pnbwork/pnb_work_observation_entity.dart';
import 'package:hsg_loyalty/domain/entity/pnb/pnbwork/pnb_work_observation_form_entity.dart';
import '../../utils/resources/data_state.dart';

abstract class PnbRepository {

  // Pnb Work
  Future<DataState<IsSuccessResponse>> savePnbWorkForm(Map<String, dynamic> requestBody);

  Future<DataState<IsSuccessResponse>> removePnbWorkForm(int formId);

  Future<DataState<PnbWorkObservationEntity>> getPnbWorkFormList(String cookie);

  Future<DataState<PnbWorkObservationFormEntity>> getPnbWorkForm(String cookie);

  // Pnb Drive
  Future<DataState<IsSuccessResponse>> savePnbDrivingForm(Map<String, dynamic> requestBody);

  Future<DataState<IsSuccessResponse>> removePnbDrivingForm(int formId);

  Future<DataState<PnbDrivingObservationEntity>> getPnbDrivingFormList(String cookie);

  Future<DataState<PnbDrivingObservationFormEntity>> getPnbDrivingForm(String cookie, int formId);


  // Places
  Future<DataState<List<PlaceEntity>>> getAllPnbPlace();

  Future<DataState<List<PlaceItemEntity>>> getAllPnbPlaceItem();

}