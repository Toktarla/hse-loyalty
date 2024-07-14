import 'package:equatable/equatable.dart';

class PnbDrivingObservationEntity extends Equatable{
  final String organizationName;
  final String startDate;
  final String organizationDepartmentName;
  final String authorFullname;
  final int id;
  final String endDate;
  final String location;

  const PnbDrivingObservationEntity({
    required this.organizationName,
    required this.startDate,
    required this.organizationDepartmentName,
    required this.authorFullname,
    required this.id,
    required this.endDate,
    required this.location,
  });

  @override
  List<Object?> get props => [
    organizationName,
    startDate,
    organizationDepartmentName,
    authorFullname,
    location,
    endDate,
    id
  ];
}