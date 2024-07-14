import 'package:equatable/equatable.dart';

class PlaceItemEntity extends Equatable {
  final int placeId;
  final String nameEn;
  final String nameKz;
  final int latitude;
  final int id;
  final String nameRu;
  final int longitude;
  final String place;

  const PlaceItemEntity({
    required this.placeId,
    required this.nameEn,
    required this.nameKz,
    required this.latitude,
    required this.id,
    required this.nameRu,
    required this.longitude,
    required this.place,
  });

  factory PlaceItemEntity.fromJson(Map<String, dynamic> json) {
    return PlaceItemEntity(
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

  @override
  List<Object?> get props => [
    placeId,
    nameEn,
    nameKz,
    latitude,
    id,
    nameRu,
    longitude,
    place,
  ];
}
