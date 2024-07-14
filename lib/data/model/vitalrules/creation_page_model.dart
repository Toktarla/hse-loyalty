import '../../../domain/entity/vitalrule/creation_page_entity.dart';

class CreationPageModel extends CreationPageEntity {
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

  CreationPageModel({
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
  }) : super(
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
            questions: questions
  );

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'SelectedOrganizationId': selectedOrganizationId,
      'OrganizationDepartmentId': organizationDepartmentId,
      'OrganizationDepartmentName': organizationDepartmentName,
      'SelectedUserName': selectedUserName,
      'SelectedEmail': selectedEmail,
      'SelectedStructuralSubdivision': selectedStructuralSubdivision,
      'TravelDate': travelDate,
      'SelectedTravelDate': selectedTravelDate,
      'SelectedPlaceOfInspectionId': selectedPlaceOfInspectionId,
      'SelectedStatusPlaceOfInspection': selectedStatusPlaceOfInspection,
      'SelectedStatusOfContractOrganization': selectedStatusOfContractOrganization,
      'SelectedNameOfContractOrganization': selectedNameOfContractOrganization,
      'Questions': questions?.map((q) => q.toJson())?.toList(),
    };
  }

  static CreationPageModel fromJson(Map<String, dynamic> json) {
    return CreationPageModel(
      id: json['Id'],
      selectedOrganizationId: json['SelectedOrganizationId'],
      organizationDepartmentId: json['OrganizationDepartmentId'],
      organizationDepartmentName: json['OrganizationDepartmentName'],
      selectedUserName: json['SelectedUserName'],
      selectedEmail: json['SelectedEmail'],
      selectedStructuralSubdivision: json['SelectedStructuralSubdivision'],
      travelDate: json['TravelDate'],
      selectedTravelDate: json['SelectedTravelDate'],
      selectedPlaceOfInspectionId: json['SelectedPlaceOfInspectionId'],
      selectedStatusPlaceOfInspection: json['SelectedStatusPlaceOfInspection'],
      selectedStatusOfContractOrganization: json['SelectedStatusOfContractOrganization'],
      selectedNameOfContractOrganization: json['SelectedNameOfContractOrganization'],
      questions: (json['Questions'] as List?)!.map((q) => Question.fromJson(q)).toList(),
    );
  }
}
