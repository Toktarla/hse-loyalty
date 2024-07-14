import '../../../../domain/entity/pnb/pnbwork/pnb_work_observation_entity.dart';

class PnbWorkObservationModel extends PnbWorkObservationEntity {
  const PnbWorkObservationModel({
    required String organizationName,
    required String organizationDepartmentName,
    required String authorFullname,
    required String task,
    required String dateCard,
    required int id,
  }) : super(
    organizationName: organizationName,
    organizationDepartmentName: organizationDepartmentName,
    authorFullname: authorFullname,
    task: task,
    dateCard: dateCard,
    id: id,
  );

  factory PnbWorkObservationModel.fromJson(Map<String, dynamic> json) {
    return PnbWorkObservationModel(
      organizationName: json['OrganizationName'],
      organizationDepartmentName: json['OrganizationDepartmentName'],
      authorFullname: json['AuthorFullname'],
      task: json['Task'],
      dateCard: json['DateCard'],
      id: json['Id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'OrganizationName': organizationName,
      'OrganizationDepartmentName': organizationDepartmentName,
      'AuthorFullname': authorFullname,
      'Task': task,
      'DateCard': dateCard,
      'Id': id,
    };
  }

  factory PnbWorkObservationModel.fromEntity(PnbWorkObservationEntity entity) {
    return PnbWorkObservationModel(
      organizationName: entity.organizationName,
      organizationDepartmentName: entity.organizationDepartmentName,
      authorFullname: entity.authorFullname,
      task: entity.task,
      dateCard: entity.dateCard,
      id: entity.id,
    );
  }
}