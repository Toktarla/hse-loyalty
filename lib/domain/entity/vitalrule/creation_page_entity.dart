import 'package:equatable/equatable.dart';

import '../../../data/model/vitalrules/creation_page_model.dart';

class CreationPageEntity extends Equatable {
  final int? id;
  final int? selectedOrganizationId;
  final int? organizationDepartmentId;
  final String? organizationDepartmentName;
  final String? selectedUserName;
  final String? selectedEmail;
  final String? selectedStructuralSubdivision;
  final String? travelDate;
  final String? selectedTravelDate;
  final int? selectedPlaceOfInspectionId;
  final String? selectedStatusPlaceOfInspection;
  final String? selectedStatusOfContractOrganization;
  final String? selectedNameOfContractOrganization;
  final List<Question>? questions;

  const CreationPageEntity({
    this.id,
     this.selectedOrganizationId,
     this.organizationDepartmentId,
     this.organizationDepartmentName,
     this.selectedUserName,
     this.selectedEmail,
     this.selectedStructuralSubdivision,
     this.travelDate,
    this.selectedTravelDate,
    this.selectedPlaceOfInspectionId,
    this.selectedStatusPlaceOfInspection,
    this.selectedStatusOfContractOrganization,
    this.selectedNameOfContractOrganization,
    this.questions,
  });

  @override
  List<Object?> get props => [
    id,
    selectedOrganizationId,
    organizationDepartmentId,
    organizationDepartmentName,
    selectedUserName,
    selectedEmail,
    selectedStructuralSubdivision,
    travelDate,
    selectedTravelDate,
    selectedPlaceOfInspectionId,
    selectedStatusPlaceOfInspection,
    selectedStatusOfContractOrganization,
    selectedNameOfContractOrganization,
    questions,
  ];

  CreationPageModel toModel() {
    return CreationPageModel(
      id: id,
      selectedOrganizationId: selectedOrganizationId,
      organizationDepartmentId: organizationDepartmentId,
      organizationDepartmentName: organizationDepartmentName,
      selectedUserName: selectedUserName,
      selectedEmail: selectedEmail,
      selectedStructuralSubdivision: selectedStructuralSubdivision,
      travelDate: travelDate,
      selectedTravelDate: selectedTravelDate,
      selectedPlaceOfInspectionId: selectedPlaceOfInspectionId,
      selectedStatusPlaceOfInspection: selectedStatusPlaceOfInspection,
      selectedStatusOfContractOrganization: selectedStatusOfContractOrganization,
      selectedNameOfContractOrganization: selectedNameOfContractOrganization,
      questions: questions,
    );
  }
}

class SecondChapterChilds extends Equatable {
  final int innerIndex;
  final int totalIndex;
  final String question;
  final String parentSecondChapterName;
  final List<int> answerVariants;
  final int? answer;

  SecondChapterChilds({
    required this.innerIndex,
    required this.totalIndex,
    required this.question,
    required this.parentSecondChapterName,
    required this.answerVariants,
    this.answer,
  });

  @override
  List<Object?> get props => [
    innerIndex,
    totalIndex,
    question,
    parentSecondChapterName,
    answerVariants,
    answer,
  ];

  Map<String, dynamic> toJson() {
    return {
      'InnerIndex': innerIndex,
      'TotalIndex': totalIndex,
      'Question': question,
      'ParentSecondChapterName': parentSecondChapterName,
      'AnswerVariants': answerVariants,
      'Answer': answer,
    };
  }

  static SecondChapterChilds fromJson(Map<String, dynamic> json) {
    return SecondChapterChilds(
      innerIndex: json['InnerIndex'],
      totalIndex: json['TotalIndex'],
      question: json['Question'],
      parentSecondChapterName: json['ParentSecondChapterName'],
      answerVariants: List<int>.from(json['AnswerVariants']),
      answer: json['Answer'],
    );
  }
}

class MainChildChapters extends Equatable {
  final int secondChapterIndex;
  final String secondChapterName;
  final String secondChapterTip;
  final List<SecondChapterChilds> secondChapterChilds;
  final String? secondChapterComment;
  final String? secondChapterCommentTip;
  final String? secondChapterFiles;

  MainChildChapters({
    required this.secondChapterIndex,
    required this.secondChapterName,
    required this.secondChapterTip,
    required this.secondChapterChilds,
    this.secondChapterComment,
    this.secondChapterCommentTip,
    this.secondChapterFiles,
  });

  @override
  List<Object?> get props => [
    secondChapterIndex,
    secondChapterName,
    secondChapterTip,
    secondChapterChilds,
    secondChapterComment,
    secondChapterCommentTip,
    secondChapterFiles,
  ];

  Map<String, dynamic> toJson() {
    return {
      'SecondChapterIndex': secondChapterIndex,
      'SecondChapterName': secondChapterName,
      'SecondChapterTip': secondChapterTip,
      'SecondChapterChilds': secondChapterChilds.map((child) => child.toJson()).toList(),
      'SecondChapterComment': secondChapterComment,
      'SecondChapterCommentTip': secondChapterCommentTip,
      'SecondChapterFiles': secondChapterFiles,
    };
  }

  static MainChildChapters fromJson(Map<String, dynamic> json) {
    return MainChildChapters(
      secondChapterIndex: json['SecondChapterIndex'],
      secondChapterName: json['SecondChapterName'],
      secondChapterTip: json['SecondChapterTip'],
      secondChapterChilds: (json['SecondChapterChilds'] as List)
          .map((child) => SecondChapterChilds.fromJson(child))
          .toList(),
      secondChapterComment: json['SecondChapterComment'],
      secondChapterCommentTip: json['SecondChapterCommentTip'],
      secondChapterFiles: json['SecondChapterFiles'],
    );
  }
}

class Question extends Equatable {
  final String mainChapterName;
  final List<MainChildChapters> mainChildChapters;

  Question({
    required this.mainChapterName,
    required this.mainChildChapters,
  });

  @override
  List<Object?> get props => [
    mainChapterName,
    mainChildChapters,
  ];

  Map<String, dynamic> toJson() {
    return {
      'MainChapterName': mainChapterName,
      'MainChildChapters': mainChildChapters.map((chapter) => chapter.toJson()).toList(),
    };
  }

  static Question fromJson(Map<String, dynamic> json) {
    return Question(
      mainChapterName: json['MainChapterName'],
      mainChildChapters: (json['MainChildChapters'] as List)
          .map((chapter) => MainChildChapters.fromJson(chapter))
          .toList(),
    );
  }
}
