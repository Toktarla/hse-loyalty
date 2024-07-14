import 'package:equatable/equatable.dart';

class OrganizationEntity extends Equatable {
  final Object? parentId;
  final bool isDeleted;
  final Object? email;
  final Object? description;
  final Object? bIN;
  final String insertDate;
  final Object? postalCode;
  final Object? shortName;
  final int organizationType;
  final String name;
  final Object? dictBranchId;
  final Object? dictCityId;
  final String updateDate;
  final Object? phone;
  final Object? jurAddress;
  final int id;

  const OrganizationEntity({
    this.parentId,
    required this.isDeleted,
    this.email,
    this.description,
    this.bIN,
    required this.insertDate,
    this.postalCode,
    this.shortName,
    required this.organizationType,
    required this.name,
    this.dictBranchId,
    this.dictCityId,
    required this.updateDate,
    this.phone,
    this.jurAddress,
    required this.id,
  });

  @override
  List<Object?> get props => [
    parentId,
    isDeleted,
    email,
    description,
    bIN,
    insertDate,
    postalCode,
    shortName,
    organizationType,
    name,
    dictBranchId,
    dictCityId,
    updateDate,
    phone,
    jurAddress,
    id,
  ];

  @override
  String toString() {
    return 'OrganizationEntity { id: $id, name: $name }';
  }
}
