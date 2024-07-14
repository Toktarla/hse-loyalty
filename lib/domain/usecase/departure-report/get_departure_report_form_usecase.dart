import 'package:hsg_loyalty/domain/entity/vitalrule/user_answers_dto_entity.dart';
import 'package:hsg_loyalty/domain/repository/departure_report_repository.dart';
import 'package:hsg_loyalty/domain/repository/vital_rules_repository.dart';
import 'package:hsg_loyalty/utils/resources/data_state.dart';
import '../../../utils/helpers/usecase_helper.dart';
import '../../entity/departure-report/departure_report_entity.dart';

class GetDepartureReportFormUsecase implements UseCase<DataState<DepartureReportEntity>, Map<String,dynamic>> {
  final DepartureReportRepository _departureReportRepository;

  GetDepartureReportFormUsecase(this._departureReportRepository);

  @override
  Future<DataState<DepartureReportEntity>> call({Map<String,dynamic>? params}) {
    return _departureReportRepository.getDepartureReportForm(params!['cookie'],params['userId']);
  }

}
