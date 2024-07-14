import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hsg_loyalty/domain/entity/departure-report/departure_report_entity.dart';

class AddReportEntityCubit extends Cubit<DepartureReportEntity> {
  AddReportEntityCubit() : super(const DepartureReportEntity());

  DepartureReportEntity _accumulatedData = const DepartureReportEntity();

  DepartureReportEntity get accumulatedData => _accumulatedData;

  void updateInput(DepartureReportEntity updatedEntity) {
    _accumulatedData = _accumulatedData.copyWith(
      id: updatedEntity.id,
      userId: updatedEntity.userId,
      companyId: updatedEntity.companyId,
      authorFullName: updatedEntity.authorFullName,
      companyName: updatedEntity.companyName,
      departureDate: updatedEntity.departureDate,
      topic: updatedEntity.topic,
      peopleCount: updatedEntity.peopleCount,
      questions: updatedEntity.questions,
      decisions: updatedEntity.decisions,
      file: updatedEntity.file,
      place: updatedEntity.place,
    );
    emit(_accumulatedData);
  }

  void clearInput() {
    _accumulatedData = const DepartureReportEntity();
    emit(_accumulatedData);
  }

  void printAccumulatedData() {
    print(_accumulatedData.toString());
  }
}
