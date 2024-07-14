import '../../../domain/entity/create/observation_type_entity.dart';

class ObservationTypeModel extends ObservationTypeEntity {
  const ObservationTypeModel({
    Object? lastChangeDate,
    required int id,
    Object? code,
    required String createDate,
    required String name,
  }) : super(
    lastChangeDate: lastChangeDate,
    id: id,
    code: code,
    createDate: createDate,
    name: name,
  );

  factory ObservationTypeModel.fromJson(Map<String, dynamic> json) {
    return ObservationTypeModel(
      lastChangeDate: json['LastChangeDate'],
      id: json['Id'],
      code: json['Code'],
      createDate: json['CreateDate'],
      name: json['Name'],
    );
  }

}