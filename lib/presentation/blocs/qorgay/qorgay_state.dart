import 'package:hsg_loyalty/domain/entity/create/departament_entity.dart';
import 'package:hsg_loyalty/domain/entity/create/observation_category_entity.dart';
import 'package:hsg_loyalty/domain/entity/create/observation_type_entity.dart';
import 'package:hsg_loyalty/domain/entity/create/organization_entity.dart';
import '../../../domain/entity/list/qorgay_entity.dart';

class QorgayState {
  final List<QorgayEntity>? qorgayEntityList;
  final List<ObservationTypeEntity>? observationTypeEntityList;
  final List<OrganizationEntity>? organizationList;
  final List<DepartmentEntity>? departamentList;

  final List<ObservationCategoryEntity>? observationCategoryEntityList;


  const QorgayState({
    this.qorgayEntityList,
    this.organizationList,
    this.observationTypeEntityList,
    this.observationCategoryEntityList,
    this.departamentList
});
}

class QorgayLaunching extends QorgayState {}

class QorgayLoading extends QorgayState {}

class AddQorgayDone extends QorgayState {

}

class QorgayDone extends QorgayState {
  const QorgayDone({
    required List<QorgayEntity>? qorgayEntityList,
    required List<ObservationTypeEntity>? observationTypeEntityList,
  }) : super(qorgayEntityList: qorgayEntityList,observationTypeEntityList: observationTypeEntityList);
}

class QorgaysForUserIdDone extends QorgayState {
  const QorgaysForUserIdDone({
    required List<QorgayEntity>? qorgayEntityList,
    required List<ObservationTypeEntity>? observationTypeEntityList,

  }) : super(qorgayEntityList: qorgayEntityList,observationTypeEntityList: observationTypeEntityList);
}

class ObservationTypesDone extends QorgayState {
  const ObservationTypesDone({
    required List<ObservationTypeEntity>? observationTypeEntityList,
  }) : super(observationTypeEntityList: observationTypeEntityList);
}

class OrganizationsDone extends QorgayState {
  const OrganizationsDone({
    required List<OrganizationEntity>? organizationList,
  }) : super(organizationList: organizationList);
}

class DepartmentsDone extends QorgayState {
  const DepartmentsDone({
    required List<DepartmentEntity>? departamentList,
  }) : super(departamentList: departamentList);
}

class ObservationCategoriesDone extends QorgayState {
  const ObservationCategoriesDone({
    required List<ObservationCategoryEntity>? observationCategoryEntityList,
  }) : super(observationCategoryEntityList: observationCategoryEntityList);
}

class QorgayError extends QorgayState {
  const QorgayError();
}

