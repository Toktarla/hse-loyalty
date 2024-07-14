import '../../../../domain/entity/pnb/pnbwork/place_item_entity.dart';

class PlaceItemModel extends PlaceItemEntity {
  const PlaceItemModel({
    required int placeId,
    required String nameEn,
    required String nameKz,
    required int latitude,
    required int id,
    required String nameRu,
    required int longitude,
    required String place,
  }) : super(
    placeId: placeId,
    nameEn: nameEn,
    nameKz: nameKz,
    latitude: latitude,
    id: id,
    nameRu: nameRu,
    longitude: longitude,
    place: place,
  );

  factory PlaceItemModel.fromJson(Map<String, dynamic> json) {
    return PlaceItemModel(
      placeId: json['PlaceId'],
      nameEn: json['NameEn'],
      nameKz: json['NameKz'],
      latitude: json['Latitude'],
      id: json['Id'],
      nameRu: json['NameRu'],
      longitude: json['Longitude'],
      place: json['Place'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'PlaceId': placeId,
      'NameEn': nameEn,
      'NameKz': nameKz,
      'Latitude': latitude,
      'Id': id,
      'NameRu': nameRu,
      'Longitude': longitude,
      'Place': place,
    };
  }

  factory PlaceItemModel.fromEntity(PlaceItemEntity entity) {
    return PlaceItemModel(
      placeId: entity.placeId,
      nameEn: entity.nameEn,
      nameKz: entity.nameKz,
      latitude: entity.latitude,
      id: entity.id,
      nameRu: entity.nameRu,
      longitude: entity.longitude,
      place: entity.place,
    );
  }
}