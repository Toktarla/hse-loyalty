import 'package:hsg_loyalty/domain/repository/departure_report_repository.dart';
import 'package:hsg_loyalty/domain/repository/vital_rules_repository.dart';
import 'package:hsg_loyalty/utils/resources/data_state.dart';
import '../../../data/model/create/isSuccessResponse.dart';
import '../../../utils/helpers/usecase_helper.dart';

class DeleteDepartureReportFormUsecase implements UseCase<DataState<IsSuccessResponse>, Map<String,dynamic>> {
  final DepartureReportRepository _departureReportRepository;

  DeleteDepartureReportFormUsecase(this._departureReportRepository);

  @override
  Future<DataState<IsSuccessResponse>> call({Map<String,dynamic>? params}) {
    return _departureReportRepository.deleteDepartureReportForm(params!['departureReportId'],params['cookie']);
  }
}
