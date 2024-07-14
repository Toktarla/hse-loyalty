import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hsg_loyalty/domain/entity/create/create_qorgay_entity.dart';

class CreateQorgayCubit extends Cubit<CreateQorgayEntity> {
  CreateQorgayCubit() : super(CreateQorgayEntity());

  CreateQorgayEntity _accumulatedData = CreateQorgayEntity();

  CreateQorgayEntity get accumulatedData => _accumulatedData;

  void updateInput(CreateQorgayEntity updatedEntity) {
    _accumulatedData = _accumulatedData.copyWith(
      dictKorgauObservationTypeId: updatedEntity.dictKorgauObservationTypeId ??
          _accumulatedData.dictKorgauObservationTypeId,
      fullName: updatedEntity.fullName ?? _accumulatedData.fullName,
      phone: updatedEntity.phone ?? _accumulatedData.phone,
      organizationId: updatedEntity.organizationId ?? _accumulatedData.organizationId,
      isContractor: updatedEntity.isContractor ?? _accumulatedData.isContractor,
      contractor: updatedEntity.contractor ?? _accumulatedData.contractor,
      organizationDepartmentId: updatedEntity.organizationDepartmentId ??
          _accumulatedData.organizationDepartmentId,
      supervisedOrganizationId: updatedEntity.supervisedOrganizationId ??
          _accumulatedData.supervisedOrganizationId,
      supervisedObject:
          updatedEntity.supervisedObject ?? _accumulatedData.supervisedObject,
      dictKorgauObservationCategories:
          updatedEntity.dictKorgauObservationCategories ??
              _accumulatedData.dictKorgauObservationCategories,
      suggestion: updatedEntity.suggestion ?? _accumulatedData.suggestion,
      files: updatedEntity.files ?? _accumulatedData.files,
      possibleConsequence: updatedEntity.possibleConsequence ??
          _accumulatedData.possibleConsequence,
      measure: updatedEntity.measure ?? _accumulatedData.measure,
      actionToEncourage:
          updatedEntity.actionToEncourage ?? _accumulatedData.actionToEncourage,
      isDiscussed: updatedEntity.isDiscussed ?? _accumulatedData.isDiscussed,
      isInformed: updatedEntity.isInformed ?? _accumulatedData.isInformed,
      informTo: updatedEntity.informTo ?? _accumulatedData.informTo,
      isEliminated: updatedEntity.isEliminated ?? _accumulatedData.isEliminated,
      incidentDateTime: updatedEntity.incidentDateTime ?? _accumulatedData.incidentDateTime,
      authorId: updatedEntity.authorId ?? _accumulatedData.authorId
    );

    emit(_accumulatedData);
  }

  void clearInput() {
    _accumulatedData = const CreateQorgayEntity();
    emit(_accumulatedData);
  }

  void printAccumulatedData() {
    print('CreateQorgayEntity:');
    print('  dictKorgauObservationTypeId: ${_accumulatedData.dictKorgauObservationTypeId}');
    print('  fullName: ${_accumulatedData.fullName}');
    // print('  phone: ${_accumulatedData.phone}');
    print('  organizationId: ${_accumulatedData.organizationId}');
    print('  isContractor: ${_accumulatedData.isContractor}');
    print('  contractor: ${_accumulatedData.contractor}');
    print('  organizationDepartmentId: ${_accumulatedData.organizationDepartmentId}');
    print('  supervisedOrganizationId: ${_accumulatedData.supervisedOrganizationId}');
    print('  supervisedObject: ${_accumulatedData.supervisedObject}');
    print('  dictKorgauObservationCategories: ${_accumulatedData.dictKorgauObservationCategories}');
    print('  suggestion: ${_accumulatedData.suggestion}');
    print('  files: ${_accumulatedData.files}');
    print('  possibleConsequence: ${_accumulatedData.possibleConsequence}');
    print('  measure: ${_accumulatedData.measure}');
    print('  actionToEncourage: ${_accumulatedData.actionToEncourage}');
    print('  isDiscussed: ${_accumulatedData.isDiscussed}');
    print('  isInformed: ${_accumulatedData.isInformed}');
    print('  informTo: ${_accumulatedData.informTo}');
    print('  isEliminated: ${_accumulatedData.isEliminated}');
    print('  incidentDateTime: ${_accumulatedData.incidentDateTime}');
    print('  authorId: ${_accumulatedData.authorId}');

  }

}
