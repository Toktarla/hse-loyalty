
import 'package:hsg_loyalty/data/model/create/isSuccessResponse.dart';
import 'package:hsg_loyalty/domain/entity/departure-report/departure_report_answer_Entity.dart';

import '../../../domain/entity/departure-report/departure_report_entity.dart';


class DepartureReportState {
  final DepartureReportAnswerEntity? departureReportAnswerEntity;
  final DepartureReportEntity? departureReportEntity;

  const DepartureReportState({
    this.departureReportAnswerEntity,
    this.departureReportEntity,
  });
}

class DepartureReportLaunching extends DepartureReportState {}

class DepartureReportLoading extends DepartureReportState {}

class DepartureReportDone extends DepartureReportState {

  const DepartureReportDone({
    required DepartureReportAnswerEntity? departureReportAnswerEntity,
    required DepartureReportEntity? departureReportEntity,

  }) : super(departureReportAnswerEntity: departureReportAnswerEntity,departureReportEntity: departureReportEntity);
}

class DepartureReportDeleted extends DepartureReportState {}

class SaveDepartureReportDone extends DepartureReportState {}

class DepartureReportError extends DepartureReportState {
  const DepartureReportError();
}
