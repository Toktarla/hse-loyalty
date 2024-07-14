import '../../../domain/entity/create/organization_entity.dart';

class OrganizationModel extends OrganizationEntity {
  const OrganizationModel({
    Object? parentId,
    required bool isDeleted,
    Object? email,
    Object? description,
    Object? bIN,
    required String insertDate,
    Object? postalCode,
    Object? shortName,
    required int organizationType,
    required String name,
    Object? dictBranchId,
    Object? dictCityId,
    required String updateDate,
    Object? phone,
    Object? jurAddress,
    required int id,
  }) : super(
    parentId: parentId,
    isDeleted: isDeleted,
    email: email,
    description: description,
    bIN: bIN,
    insertDate: insertDate,
    postalCode: postalCode,
    shortName: shortName,
    organizationType: organizationType,
    name: name,
    dictBranchId: dictBranchId,
    dictCityId: dictCityId,
    updateDate: updateDate,
    phone: phone,
    jurAddress: jurAddress,
    id: id,
  );



  factory OrganizationModel.fromJson(Map<String, dynamic> json) {
    return OrganizationModel(
      parentId: json['ParentId'],
      isDeleted: json['IsDeleted'],
      email: json['Email'],
      description: json['Description'],
      bIN: json['BIN'],
      insertDate: json['InsertDate'],
      postalCode: json['PostalCode'],
      shortName: json['ShortName'],
      organizationType: json['OrganizationType'],
      name: json['Name'],
      dictBranchId: json['DictBranchId'],
      dictCityId: json['DictCityId'],
      updateDate: json['UpdateDate'],
      phone: json['Phone'],
      jurAddress: json['JurAddress'],
      id: json['Id'],
    );
  }
}