import 'package:hsg_loyalty/domain/entity/departure-report/departure_report_answer_Entity.dart';
import 'package:hsg_loyalty/domain/repository/departure_report_repository.dart';
import 'package:hsg_loyalty/utils/resources/data_state.dart';
import '../../../utils/helpers/usecase_helper.dart';
import '../../entity/departure-report/departure_report_entity.dart';

class GetDepartureReportFormListUsecase implements UseCase<DataState<DepartureReportAnswerEntity>, String> {
  final DepartureReportRepository _departureReportRepository;

  GetDepartureReportFormListUsecase(this._departureReportRepository);

  @override
  Future<DataState<DepartureReportAnswerEntity>> call({String? params}) {
    return _departureReportRepository.getDepartureReportFormList(params!);
  }
}
