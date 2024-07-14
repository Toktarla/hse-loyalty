import 'package:hsg_loyalty/domain/entity/departure-report/departure_report_entity.dart';

abstract class DepartureReportEvent {
  const DepartureReportEvent();
}

class GetDepartureReportListEvent extends DepartureReportEvent {
  GetDepartureReportListEvent();
}

class GetDepartureReportEvent extends DepartureReportEvent {
  final int userId;
  GetDepartureReportEvent(this.userId);
}

class GetDepartureReportForUserEvent extends DepartureReportEvent {
  GetDepartureReportForUserEvent();
}

class SaveDepartureReportEvent extends DepartureReportEvent {
  final DepartureReportEntity requestBody;
  SaveDepartureReportEvent(this.requestBody);
}

class DeleteDepartureReportEvent extends DepartureReportEvent {
  final int formId;
  DeleteDepartureReportEvent(this.formId);
}