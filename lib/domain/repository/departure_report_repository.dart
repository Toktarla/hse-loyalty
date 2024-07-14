import 'package:hsg_loyalty/data/model/create/isSuccessResponse.dart';
import 'package:hsg_loyalty/domain/entity/departure-report/departure_report_answer_Entity.dart';
import 'package:hsg_loyalty/domain/entity/departure-report/departure_report_entity.dart';
import '../../utils/resources/data_state.dart';

abstract class DepartureReportRepository {

  Future<DataState<IsSuccessResponse>> saveDepartureReportForm(DepartureReportEntity departureReportEntity);

  Future<DataState<IsSuccessResponse>> deleteDepartureReportForm(int departureReportId,String cookie);

  Future<DataState<DepartureReportAnswerEntity>> getDepartureReportFormList(String cookie);

  Future<DataState<DepartureReportAnswerEntity>> getDepartureReportFormListForUser(String cookie);

  Future<DataState<DepartureReportEntity>> getDepartureReportForm(String cookie, int userId);

}
