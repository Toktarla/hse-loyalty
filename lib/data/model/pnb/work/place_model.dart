import '../../../../domain/entity/pnb/pnbwork/place_entity.dart';

class PlaceModel extends PlaceEntity {
  const PlaceModel({
     String? updateDate,
     String? nameEn,
     String? insertDate,
     String? nameKz,
    double? latitude,
     int? id,
     int? organizationId,
     String? nameRu,
    double? longitude,
  }) : super(
    updateDate: updateDate,
    nameEn: nameEn,
    insertDate: insertDate,
    nameKz: nameKz,
    latitude: latitude,
    id: id,
    organizationId: organizationId,
    nameRu: nameRu,
    longitude: longitude,
  );

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceModel(
      updateDate: json['UpdateDate'],
      nameEn: json['NameEn'],
      insertDate: json['InsertDate'],
      nameKz: json['NameKz'],
      latitude: json['Latitude'],
      id: json['Id'],
      organizationId: json['OrganizationId'],
      nameRu: json['NameRu'],
      longitude: json['Longitude'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'UpdateDate': updateDate,
      'NameEn': nameEn,
      'InsertDate': insertDate,
      'NameKz': nameKz,
      'Latitude': latitude,
      'Id': id,
      'OrganizationId': organizationId,
      'NameRu': nameRu,
      'Longitude': longitude,
    };
  }

  factory PlaceModel.fromEntity(PlaceEntity entity) {
    return PlaceModel(
      updateDate: entity.updateDate,
      nameEn: entity.nameEn,
      insertDate: entity.insertDate,
      nameKz: entity.nameKz,
      latitude: entity.latitude,
      id: entity.id,
      organizationId: entity.organizationId,
      nameRu: entity.nameRu,
      longitude: entity.longitude,
    );
  }
}