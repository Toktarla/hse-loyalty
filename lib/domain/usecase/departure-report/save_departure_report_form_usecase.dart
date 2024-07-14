import 'package:hsg_loyalty/data/model/departure-report/departure_report_model.dart';
import 'package:hsg_loyalty/domain/entity/departure-report/departure_report_entity.dart';
import 'package:hsg_loyalty/domain/repository/departure_report_repository.dart';
import 'package:hsg_loyalty/domain/repository/vital_rules_repository.dart';
import 'package:hsg_loyalty/utils/resources/data_state.dart';
import '../../../data/model/create/isSuccessResponse.dart';
import '../../../utils/helpers/usecase_helper.dart';

class SaveDepartureReportFormUsecase implements UseCase<DataState<IsSuccessResponse>, DepartureReportEntity> {
  final DepartureReportRepository _departureReportRepository;

  SaveDepartureReportFormUsecase(this._departureReportRepository);

  @override
  Future<DataState<IsSuccessResponse>> call({DepartureReportEntity? params}) {
    return _departureReportRepository.saveDepartureReportForm(params!);
  }
}
