import 'dart:io';

import 'package:equatable/equatable.dart';

import 'attachments_item_entity.dart';

class QorgayEntity extends Equatable {
  final String? organizationName;
  final bool? isInformed;
  final int? organizationDepartmentId;
  final int? organizationId;
  final List<AttachmentsItemEntity>? attachments;
  final String? possibleConsequence;
  final String? suggestion;
  final String? contractor;
  final List<int>? dictKorgauObservationCategories;
  final bool? isDiscussed;
  final String? phone;
  final String? measure;
  final String? incidentDatetime;
  final List<File>? files;
  final String? actionToEncourage;
  final int? supervisedOrganizationId;
  final int? status;
  final int? dictKorgauObservationTypeId;
  final String? informTo;
  final String? phoneUID;
  final bool? isContractor;
  final bool? isEliminated;
  final String? fullName;
  final String? supervisedObject;
  final int? id;

  const QorgayEntity({
    required this.organizationName,
    required this.isInformed,
    required this.organizationDepartmentId,
    required this.organizationId,
    required this.attachments,
    required this.possibleConsequence,
    required this.suggestion,
    required this.contractor,
    required this.dictKorgauObservationCategories,
    required this.isDiscussed,
    required this.phone,
    required this.measure,
    required this.incidentDatetime,
    required this.files,
    required this.actionToEncourage,
    required this.supervisedOrganizationId,
    required this.status,
    required this.dictKorgauObservationTypeId,
    required this.informTo,
    required this.phoneUID,
    required this.isContractor,
    required this.isEliminated,
    required this.fullName,
    required this.supervisedObject,
    required this.id,
  });

  @override
  List<Object?> get props => [
    organizationName,
    isInformed,
    organizationDepartmentId,
    organizationId,
    attachments,
    possibleConsequence,
    suggestion,
    contractor,
    dictKorgauObservationCategories,
    isDiscussed,
    phone,
    measure,
    incidentDatetime,
    files,
    actionToEncourage,
    supervisedOrganizationId,
    status,
    dictKorgauObservationTypeId,
    informTo,
    phoneUID,
    isContractor,
    isEliminated,
    fullName,
    supervisedObject,
    id,
  ];
}
