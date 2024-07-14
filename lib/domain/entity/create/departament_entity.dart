import 'package:equatable/equatable.dart';

class DepartmentEntity extends Equatable {
  final Object? organizationName;
  final String? updateDate;
  final Object? nameEn;
  final String? insertDate;
  final Object? nameKz;
  final int? id;
  final int? organizationId;
  final String? nameRu;

  const DepartmentEntity({
    this.organizationName,
    this.updateDate,
    this.nameEn,
    this.insertDate,
    this.nameKz,
    this.id,
    this.organizationId,
    this.nameRu,
  });

  @override
  List<Object?> get props => [
    organizationName,
    updateDate,
    nameEn,
    insertDate,
    nameKz,
    id,
    organizationId,
    nameRu,
  ];
}
