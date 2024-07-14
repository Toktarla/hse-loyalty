import '../../../domain/entity/vitalrule/user_answers_dto_entity.dart';
import 'answers_dto_model.dart';
import 'comments_dto_model.dart';
import 'files_dto_model.dart';

class UserAnswersDtoModel extends UserAnswersDtoEntity {
  const UserAnswersDtoModel({
    int? id,
    required String? organizationName,
    required int? organizationId,
    required String? fullName,
    required String? email,
    required String? structuralSubdivision,
    required String? travelDate,
    required String? placeOfInspection,
    required String? statusOfContractOrganization,
    required String? nameOfContractOrganization,
    required List<AnswersDtoModel>? userAnswers,
    required List<CommentsDtoModel>? comments,
    required List<FilesDtoModel>? files,
    required List<BaseFilesDtoModel>? baseFiles,
  }) : super(
    id: id,
    organizationId: organizationId,
    organizationName: organizationName,
    fullName: fullName,
    email: email,
    structuralSubdivision: structuralSubdivision,
    travelDate: travelDate,
    placeOfInspection: placeOfInspection,
    statusOfContractOrganization: statusOfContractOrganization,
    nameOfContractOrganization: nameOfContractOrganization,
    userAnswers: userAnswers,
    comments: comments,
    files: files,
    baseFiles: baseFiles,
  );

  factory UserAnswersDtoModel.fromJson(Map<String, dynamic> json) {
    return UserAnswersDtoModel(
      id: json['Id'],
      organizationName: json['OrganizationName'],
      organizationId: json['OrganizationId'],
      fullName: json['UserName'],
      email: json['Email'],
      structuralSubdivision: json['StructuralSubdivision'],
      travelDate: json['TravelDate'],
      placeOfInspection: json['PlaceOfInspection'],
      statusOfContractOrganization: json['ContractOrganizationStatus'],
      nameOfContractOrganization: json['ContractOrganizationName'],
      // TODO : IMPLEMENT FROMJSON TO LISTS
      userAnswers: [],
      baseFiles: [],
      comments: [],
      files: [],
      // userAnswers: (json['UserAnswers'] as List)
      //     .map((e) => AnswersDtoModel.fromJson(e as Map<String, dynamic>))
      //     .toList(),
      // comments: (json['Comments'] as List)
      //     .map((e) => CommentsDtoModel.fromJson(e as Map<String, dynamic>))
      //     .toList(),
      // files: (json['Files'] as List)
      //     .map((e) => FilesDtoModel.fromJson(e as Map<String, dynamic>))
      //     .toList(),
      // baseFiles: (json['BaseFiles'] as List)
      //     .map((e) => BaseFilesDtoModel.fromJson(e as Map<String, dynamic>))
      //     .toList(),
    );
  }

  Map<String, dynamic> toJson() {
      return {
      "Department": organizationId,
      'FullName': fullName,
      'StructuralSubdivision': structuralSubdivision,
      'TravelDate': travelDate,
      'PlaceOfInspection': "5",
      'StatusOfContractOrganization': statusOfContractOrganization,
      'NameOfContractOrganization': nameOfContractOrganization,
      'UserAnswers': userAnswers?.map((e) => (e as AnswersDtoModel).toJson()).toList(),
      'Comments': comments?.map((e) => (e as CommentsDtoModel).toJson()).toList(),
      'Files': files?.map((e) => (e as FilesDtoModel).toJson()).toList(),
    };
  }
}
