import 'dart:io';

import '../../../domain/entity/create/create_qorgay_entity.dart';

class CreateQorgayModel extends CreateQorgayEntity {
  const CreateQorgayModel({

    int? dictKorgauObservationTypeId,
    String? fullName,
    String? phone,
    int? organizationId,
    bool? isContractor,
    String? contractor,
    int? organizationDepartmentId,
    int? supervisedOrganizationId,
    String? supervisedObject,
    List<int>? dictKorgauObservationCategories,
    String? suggestion,
    List<File>? files,
    String? possibleConsequence,
    String? measure,
    String? actionToEncourage,
    bool? isDiscussed,
    bool? isInformed,
    String? informTo,
    bool? isEliminated,
    String? incidentDateTime,
    int? authorId
  }) : super(
    dictKorgauObservationTypeId: dictKorgauObservationTypeId,
    fullName: fullName,
    authorId: authorId,
    phone: phone,
    organizationId: organizationId,
    isContractor: isContractor,
    contractor: contractor,
    organizationDepartmentId: organizationDepartmentId,
    supervisedOrganizationId: supervisedOrganizationId,
    supervisedObject: supervisedObject,
    dictKorgauObservationCategories: dictKorgauObservationCategories,
    suggestion: suggestion,
    files: files,
    possibleConsequence: possibleConsequence,
    measure: measure,
    actionToEncourage: actionToEncourage,
    isDiscussed: isDiscussed,
    isInformed: isInformed,
    informTo: informTo,
    isEliminated: isEliminated,
    incidentDateTime: incidentDateTime
  );

  CreateQorgayEntity toEntity() {
    return CreateQorgayEntity(
      fullName: fullName,
      dictKorgauObservationTypeId: dictKorgauObservationTypeId,
      organizationId: organizationDepartmentId,
      actionToEncourage: actionToEncourage,
      contractor: contractor,
      dictKorgauObservationCategories: dictKorgauObservationCategories,
      files: files,
      informTo: informTo,
      isContractor: isContractor,
      isDiscussed: isDiscussed,
      isEliminated: isEliminated,
      isInformed: isInformed,
      measure: measure,
      organizationDepartmentId: organizationDepartmentId,
      possibleConsequence: possibleConsequence,
      phone: phone,
      suggestion: suggestion,
      supervisedObject: supervisedObject,
      supervisedOrganizationId: supervisedOrganizationId,
      incidentDateTime: incidentDateTime,
      authorId: authorId
    );
  }

}