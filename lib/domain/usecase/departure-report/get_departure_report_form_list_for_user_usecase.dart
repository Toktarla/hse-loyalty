import 'package:hsg_loyalty/domain/entity/vitalrule/user_answers_dto_entity.dart';
import 'package:hsg_loyalty/domain/repository/departure_report_repository.dart';
import 'package:hsg_loyalty/domain/repository/vital_rules_repository.dart';
import 'package:hsg_loyalty/utils/resources/data_state.dart';
import '../../../utils/helpers/usecase_helper.dart';
import '../../entity/departure-report/departure_report_answer_Entity.dart';
import '../../entity/departure-report/departure_report_entity.dart';

class GetDepartureReportFormListForUserUsecase implements UseCase<DataState<DepartureReportAnswerEntity>, String> {
  final DepartureReportRepository _departureReportRepository;

  GetDepartureReportFormListForUserUsecase(this._departureReportRepository);

  @override
  Future<DataState<DepartureReportAnswerEntity>> call({String? params}) {
    return _departureReportRepository.getDepartureReportFormListForUser(params!);
  }

}
