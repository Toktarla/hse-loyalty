import 'dart:io';

import 'package:equatable/equatable.dart';

import '../../../data/model/departure-report/departure_report_model.dart';

class DepartureReportEntity extends Equatable {
  final int? id;
  final int? userId;
  final int? companyId;
  final String? authorFullName;
  final String? companyName;
  final String? departureDate;
  final String? topic;
  final int? peopleCount;
  final String? questions;
  final String? decisions;
  final List<File>? file;
  final String? place;

  const DepartureReportEntity({
    this.id,
    this.userId,
    this.companyId,
    this.authorFullName,
    this.companyName,
    this.departureDate,
    this.topic,
    this.peopleCount,
    this.questions,
    this.decisions,
    this.file,
    this.place,
  });

  DepartureReportEntity copyWith({
    int? id,
    int? userId,
    int? companyId,
    String? authorFullName,
    String? companyName,
    String? departureDate,
    String? topic,
    int? peopleCount,
    String? questions,
    String? decisions,
    List<File>? file,
    String? place,
  }) {
    return DepartureReportEntity(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      companyId: companyId ?? this.companyId,
      authorFullName: authorFullName ?? this.authorFullName,
      companyName: companyName ?? this.companyName,
      departureDate: departureDate ?? this.departureDate,
      topic: topic ?? this.topic,
      peopleCount: peopleCount ?? this.peopleCount,
      questions: questions ?? this.questions,
      decisions: decisions ?? this.decisions,
      file: file ?? this.file,
      place: place ?? this.place,
    );
  }

  DepartureReportModel toModel() {
    return DepartureReportModel(
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

  @override
  List<Object?> get props => [
    id,
    userId,
    companyId,
    authorFullName,
    companyName,
    departureDate,
    topic,
    peopleCount,
    questions,
    decisions,
    file,
    place,
  ];

  @override
  String toString() {
    return 'DepartureReportEntity {'
        'id: $id, '
        'userId: $userId, '
        'companyId: $companyId, '
        'authorFullName: $authorFullName, '
        'companyName: $companyName, '
        'departureDate: $departureDate, '
        'topic: $topic, '
        'peopleCount: $peopleCount, '
        'questions: $questions, '
        'decisions: $decisions, '
        'file: $file, '
        'place: $place'
        '}';
  }
}

