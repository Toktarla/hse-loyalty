import '../../../domain/entity/create/departament_entity.dart';

class DepartmentModel extends DepartmentEntity {
  const DepartmentModel({
    Object? organizationName,
    String? updateDate,
    Object? nameEn,
    String? insertDate,
    Object? nameKz,
    int? id,
    int? organizationId,
    String? nameRu,
  }) : super(
    organizationName: organizationName,
    updateDate: updateDate,
    nameEn: nameEn,
    insertDate: insertDate,
    nameKz: nameKz,
    id: id,
    organizationId: organizationId,
    nameRu: nameRu,
  );

  factory DepartmentModel.fromJson(Map<String, dynamic> json) {
    return DepartmentModel(
      organizationName: json['OrganizationName'],
      updateDate: json['UpdateDate'],
      nameEn: json['NameEn'],
      insertDate: json['InsertDate'],
      nameKz: json['NameKz'],
      id: json['Id'],
      organizationId: json['OrganizationId'],
      nameRu: json['NameRu'],
    );
  }

  DepartmentEntity toEntity() {
    return DepartmentEntity(
      id: id,
      insertDate: insertDate,
      nameEn: nameEn,
      nameKz: nameKz,
      nameRu: nameRu,
      organizationId: organizationId,
      organizationName: organizationName,
      updateDate: updateDate
    );
  }

}