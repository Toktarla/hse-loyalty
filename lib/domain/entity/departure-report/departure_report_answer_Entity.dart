import 'package:equatable/equatable.dart';
import 'package:hsg_loyalty/domain/entity/departure-report/departure_report_entity.dart';

class DepartureReportAnswerEntity extends Equatable {
  final List<DepartureReportEntity>? data;
  final int? page;
  final int? count;
  final List<int>? pagination;
  final bool? getAll;

  const DepartureReportAnswerEntity({
    required this.data,
    required this.page,
    required this.count,
    required this.pagination,
    required this.getAll,
  });

  @override
  List<Object?> get props => [data,page,count,pagination,getAll];

}