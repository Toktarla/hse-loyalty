import 'package:equatable/equatable.dart';
import 'package:hsg_loyalty/data/model/vitalrules/user_answers_dto_model.dart';
import 'answers_dto_entity.dart';
import 'comments_dto_entity.dart';
import 'files_dto_entity_entity.dart';

class UserAnswersDtoEntity extends Equatable {
  final int? id;
  final String? organizationName;
  final int? organizationId;
  final String? fullName;
  final String? email;
  final String? structuralSubdivision;
  final String? travelDate;
  final String? placeOfInspection;
  final String? statusOfContractOrganization;
  final String? nameOfContractOrganization;
  final List<AnswersDtoEntity>? userAnswers;
  final List<CommentsDtoEntity>? comments;
  final List<FilesDtoEntity>? files;
  final List<BaseFilesDtoEntity>? baseFiles;

  const UserAnswersDtoEntity({
    this.id,
    this.fullName,
    this.organizationId,
    this.email,
    this.organizationName,
    this.structuralSubdivision,
    this.travelDate,
    this.placeOfInspection,
    this.statusOfContractOrganization,
    this.nameOfContractOrganization,
    this.userAnswers,
    this.comments,
    this.files,
    this.baseFiles,
  });

  UserAnswersDtoEntity copyWith({
    int? id,
    String? organizationName,
    int? organizationId,
    String? fullName,
    String? email,
    String? structuralSubdivision,
    String? travelDate,
    String? placeOfInspection,
    String? statusOfContractOrganization,
    String? nameOfContractOrganization,
    List<AnswersDtoEntity>? userAnswers,
    List<CommentsDtoEntity>? comments,
    List<FilesDtoEntity>? files,
    List<BaseFilesDtoEntity>? baseFiles,
  }) {
    return UserAnswersDtoEntity(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      organizationId: organizationId ?? this.organizationId,
      email: email ?? this.email,
      organizationName: organizationName ?? this.organizationName,
      structuralSubdivision: structuralSubdivision ?? this.structuralSubdivision,
      travelDate: travelDate ?? this.travelDate,
      placeOfInspection: placeOfInspection ?? this.placeOfInspection,
      statusOfContractOrganization: statusOfContractOrganization ?? this.statusOfContractOrganization,
      nameOfContractOrganization: nameOfContractOrganization ?? this.nameOfContractOrganization,
      userAnswers: userAnswers ?? this.userAnswers,
      comments: comments ?? this.comments,
      files: files ?? this.files,
      baseFiles: baseFiles ?? this.baseFiles,
    );
  }

  UserAnswersDtoModel toModel() {
    return UserAnswersDtoModel(
      id: id,
      fullName: fullName,
      organizationId: organizationId,
      email: email,
      organizationName: organizationName,
      structuralSubdivision: structuralSubdivision,
      travelDate: travelDate,
      placeOfInspection: placeOfInspection,
      statusOfContractOrganization: statusOfContractOrganization,
      nameOfContractOrganization: nameOfContractOrganization,
      userAnswers: userAnswers?.map((answer) => answer.toModel()).toList(),
      comments: comments?.map((comment) => comment.toModel()).toList(),
      files: files?.map((file) => file.toModel()).toList(),
      baseFiles: baseFiles?.map((baseFile) => baseFile.toModel()).toList(),
    );
  }

  @override
  List<Object?> get props => [
    id,
    organizationId,
    organizationName,
    fullName,
    email,
    structuralSubdivision,
    travelDate,
    placeOfInspection,
    statusOfContractOrganization,
    nameOfContractOrganization,
    userAnswers,
    comments,
    files,
    baseFiles,
  ];

}