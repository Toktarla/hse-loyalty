import 'package:hsg_loyalty/data/model/departure-report/departure_report_model.dart';
import 'package:hsg_loyalty/domain/entity/departure-report/departure_report_entity.dart';

import '../../../domain/entity/departure-report/departure_report_answer_Entity.dart';

class DepartureReportAnswerModel extends DepartureReportAnswerEntity {

  const DepartureReportAnswerModel({
    required List<DepartureReportModel>? data,
    required int? page,
    required int? count,
    required List<int>? pagination,
    required bool? getAll,
  }) : super(
    data: data,
    page: page,
    count: count,
    pagination: pagination,
    getAll: getAll,
  );

  factory DepartureReportAnswerModel.fromJson(Map<String, dynamic> json) {
    return DepartureReportAnswerModel(
      data: (json['Data'] as List)
          .map((e) => DepartureReportModel.fromJson(e as Map<String, dynamic>))
          .toList() ?? [],
      page: json['Page'] ,
      count: json['Count'],
      pagination: List<int>.from(json['Pagination']),
      getAll: json['GetAll'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Data': data?.map((e) => (e as DepartureReportModel).toJson()).toList() ?? [],
      'Page': page,
      'Count': count,
      'Pagination': pagination,
      'GetAll': getAll,
    };
  }

  DepartureReportAnswerEntity toEntity() {
    return DepartureReportAnswerEntity(
      data: data,
      page: page,
      count: count,
      pagination: pagination,
      getAll: getAll,
    );
  }
}
