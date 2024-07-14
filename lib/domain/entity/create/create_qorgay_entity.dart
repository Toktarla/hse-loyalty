import 'package:equatable/equatable.dart';
import 'dart:io';

import 'package:hsg_loyalty/data/model/create/create_qorgay_model.dart';

class CreateQorgayEntity extends Equatable {
  final int? dictKorgauObservationTypeId;
  final String? fullName;
  final int? authorId;
  final String? phone;
  final int? organizationId;
  final bool? isContractor;
  final String? contractor;
  final int? organizationDepartmentId;
  final int? supervisedOrganizationId;
  final String? supervisedObject;
  final List<int>? dictKorgauObservationCategories;
  final String? suggestion;
  final List<File>? files;
  final String? possibleConsequence;
  final String? measure;
  final String? actionToEncourage;
  final bool? isDiscussed;
  final bool? isInformed;
  final String? informTo;
  final bool? isEliminated;
  final String? incidentDateTime;

  const CreateQorgayEntity({
    this.dictKorgauObservationTypeId,
    this.fullName,
    this.phone,
    this.organizationId,
    this.isContractor,
    this.contractor,
    this.organizationDepartmentId,
    this.supervisedOrganizationId,
    this.supervisedObject,
    this.dictKorgauObservationCategories,
    this.suggestion,
    this.files,
    this.possibleConsequence,
    this.measure,
    this.actionToEncourage,
    this.isDiscussed,
    this.isInformed,
    this.informTo,
    this.isEliminated,
    this.incidentDateTime,
    this.authorId
  });

  Map<String, dynamic> toJson() {
    return {
      'DictKorgauObservationTypeId': dictKorgauObservationTypeId,
      'FullName': fullName,
      'Phone': phone,
      'OrganizationId': organizationId,
      'IsContractor': isContractor,
      'Contractor': contractor,
      'OrganizationDepartmentId': organizationDepartmentId,
      'SupervisedOrganizationId': supervisedOrganizationId,
      'SupervisedObject': supervisedObject,
      'DictKorgauObservationCategories': dictKorgauObservationCategories,
      'Suggestion': suggestion,
      'Files': files,
      'PossibleConsequence': possibleConsequence,
      'Measure': measure,
      'ActionToEncourage': actionToEncourage,
      'IsDiscussed': isDiscussed,
      'IsInformed': isInformed,
      'InformTo': informTo,
      'IsEliminated': isEliminated,
      'IncidentDatetime': incidentDateTime,
      'AuthorId': authorId
    };
  }

  CreateQorgayModel toModel() {
    return CreateQorgayModel(
      fullName: fullName,
      dictKorgauObservationTypeId: dictKorgauObservationTypeId,
      organizationId: organizationId,
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

  CreateQorgayEntity copyWith({
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
  }) {
    return CreateQorgayEntity(
      dictKorgauObservationTypeId: dictKorgauObservationTypeId ?? this.dictKorgauObservationTypeId,
      fullName: fullName ?? this.fullName,
      phone: phone ?? this.phone,
      organizationId: organizationId ?? this.organizationId,
      isContractor: isContractor ?? this.isContractor,
      contractor: contractor ?? this.contractor,
      organizationDepartmentId: organizationDepartmentId ?? this.organizationDepartmentId,
      supervisedOrganizationId: supervisedOrganizationId ?? this.supervisedOrganizationId,
      supervisedObject: supervisedObject ?? this.supervisedObject,
      dictKorgauObservationCategories: dictKorgauObservationCategories ?? this.dictKorgauObservationCategories,
      suggestion: suggestion ?? this.suggestion,
      files: files ?? this.files,
      possibleConsequence: possibleConsequence ?? this.possibleConsequence,
      measure: measure ?? this.measure,
      actionToEncourage: actionToEncourage ?? this.actionToEncourage,
      isDiscussed: isDiscussed ?? this.isDiscussed,
      isInformed: isInformed ?? this.isInformed,
      informTo: informTo ?? this.informTo,
      isEliminated: isEliminated ?? this.isEliminated,
      incidentDateTime: incidentDateTime ?? this.incidentDateTime,
      authorId: authorId ?? this.authorId
    );
  }

  @override
  List<Object?> get props => [
    dictKorgauObservationTypeId,
    fullName,
    phone,
    organizationId,
    isContractor,
    contractor,
    organizationDepartmentId,
    supervisedOrganizationId,
    supervisedObject,
    dictKorgauObservationCategories,
    suggestion,
    files,
    possibleConsequence,
    measure,
    actionToEncourage,
    isDiscussed,
    isInformed,
    informTo,
    isEliminated,
    incidentDateTime,
    authorId
  ];


}
