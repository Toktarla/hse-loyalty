import 'package:equatable/equatable.dart';

class PnbWorkObservationEntity extends Equatable {
  final String organizationName;
  final String organizationDepartmentName;
  final String authorFullname;
  final String task;
  final String dateCard;
  final int id;

  const PnbWorkObservationEntity({
    required this.organizationName,
    required this.organizationDepartmentName,
    required this.authorFullname,
    required this.task,
    required this.dateCard,
    required this.id,
  });

  factory PnbWorkObservationEntity.fromJson(Map<String, dynamic> json) {
    return PnbWorkObservationEntity(
      organizationName: json['OrganizationName'],
      organizationDepartmentName: json['OrganizationDepartmentName'],
      authorFullname: json['AuthorFullname'],
      task: json['Task'],
      dateCard: json['DateCard'],
      id: json['Id'],
    );
  }

  @override
  List<Object?> get props => [organizationName, organizationDepartmentName, authorFullname, task, dateCard, id];

}