import 'package:equatable/equatable.dart';

class PlaceEntity extends Equatable {
  final String? updateDate;
  final String? nameEn;
  final String? insertDate;
  final String? nameKz;
  final double? latitude;
  final int? id;
  final int? placeId;
  final int? organizationId;
  final String? nameRu;
  final double? longitude;

  const PlaceEntity({
     this.updateDate,
     this.nameEn,
     this.insertDate,
     this.nameKz,
     this.latitude,
     this.id,
     this.organizationId,
     this.nameRu,
     this.longitude,
     this.placeId
  });

  factory PlaceEntity.fromJson(Map<String, dynamic> json) {
    return PlaceEntity(
      updateDate: json['UpdateDate'],
      nameEn: json['NameEn'],
      insertDate: json['InsertDate'],
      nameKz: json['NameKz'],
      latitude: json['Latitude'],
      id: json['Id'],
      organizationId: json['OrganizationId'],
      nameRu: json['NameRu'],
      longitude: json['Longitude'],
      placeId: json['PlaceId']
    );
  }

  @override
  List<Object?> get props => [
    updateDate,
    nameEn,
    insertDate,
    nameKz,
    latitude,
    id,
    organizationId,
    nameRu,
    longitude,
    placeId
  ];
}
