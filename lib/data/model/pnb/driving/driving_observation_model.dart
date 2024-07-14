import 'package:hsg_loyalty/domain/entity/pnb/driving/pnb_driving_observation_entity.dart';

class PnbDrivingObservationModel extends PnbDrivingObservationEntity {
  const PnbDrivingObservationModel({
    required String organizationName,
    required String startDate,
    required String organizationDepartmentName,
    required String authorFullname,
    required int id,
    required String endDate,
    required String location,
  }) : super(
    organizationName: organizationName,
    startDate: startDate,
    organizationDepartmentName: organizationDepartmentName,
    authorFullname: authorFullname,
    id: id,
    endDate: endDate,
    location: location,
  );

  factory PnbDrivingObservationModel.fromJson(Map<String, dynamic> json) {
    return PnbDrivingObservationModel(
      organizationName: json['OrganizationName'],
      startDate: json['StartDate'],
      organizationDepartmentName: json['OrganizationDepartmentName'],
      authorFullname: json['AuthorFullname'],
      id: json['Id'],
      endDate: json['EndDate'],
      location: json['Location'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'OrganizationName': organizationName,
      'StartDate': startDate,
      'OrganizationDepartmentName': organizationDepartmentName,
      'AuthorFullname': authorFullname,
      'Id': id,
      'EndDate': endDate,
      'Location': location,
    };
  }

  factory PnbDrivingObservationModel.fromEntity(PnbDrivingObservationEntity entity) {
    return PnbDrivingObservationModel(
      organizationName: entity.organizationName,
      startDate: entity.startDate,
      organizationDepartmentName: entity.organizationDepartmentName,
      authorFullname: entity.authorFullname,
      id: entity.id,
      endDate: entity.endDate,
      location: entity.location,
    );
  }
}