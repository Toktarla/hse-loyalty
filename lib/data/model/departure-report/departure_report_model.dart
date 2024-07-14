import 'dart:convert';
import 'dart:io';
import 'package:hsg_loyalty/domain/entity/departure-report/departure_report_entity.dart';

class DepartureReportModel extends DepartureReportEntity {
  const DepartureReportModel({
    required int? id,
    required int? userId,
    required int? companyId,
    required String? authorFullName,
    required String? companyName,
    required String? departureDate,
    required String? topic,
    required int? peopleCount,
    required String? questions,
    required String? decisions,
    required List<File>? file,
    required String? place,
  }) : super(
    id: id,
    userId: userId,
    companyId: companyId,
    authorFullName: authorFullName,
    companyName: companyName,
    departureDate: departureDate,
    topic: topic,
    peopleCount: peopleCount,
    questions: questions,
    decisions: decisions,
    file: file,
    place: place,
  );

  factory DepartureReportModel.fromJson(Map<String, dynamic> json) {
    return DepartureReportModel(
      id: json["Id"],
      userId: json['UserId'],
      companyId: json['CompanyId'] ?? -1,
      authorFullName: json['AuthorFullName'],
      companyName: json['CompanyName'],
      departureDate: json['DepartureDate'],
      topic: json['Topic'],
      peopleCount: json['PeopleCount'] ?? 0,
      questions: json['Questions'] ?? "",
      decisions: json['Decisions'] ?? "",
      file: (json['File'] as List<dynamic>?)
          ?.map((fileJson) => File(fileJson.toString()))
          .toList(),
      place: json['Place'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    List<String>? filePaths = file?.map((file) => file.path).toList();

    return {
      'Id': id,
      'UserId': userId,
      'CompanyId': companyId,
      'AuthorFullName': authorFullName,
      'CompanyName': companyName,
      'DepartureDate': departureDate,
      'Topic': topic,
      'PeopleCount': peopleCount,
      'Questions': questions,
      'Decisions': decisions,
      'File': filePaths,
      'Place': place,
    };
  }

  DepartureReportEntity toEntity() {
    return DepartureReportEntity(
      id: id,
      userId: userId,
      companyId: companyId,
      authorFullName: authorFullName,
      companyName: companyName,
      departureDate: departureDate,
      topic: topic,
      peopleCount: peopleCount,
      questions: questions,
      decisions: decisions,
      file: file,
      place: place,
    );
  }
}
