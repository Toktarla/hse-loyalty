import 'package:equatable/equatable.dart';

class PagingEntity<T> extends Equatable {
  final int totalCount;
  final int pageNum;
  final int pageCount;
  final int rowMin;
  final List<T> list;
  final int rowMax;

  const PagingEntity({
    required this.totalCount,
    required this.pageNum,
    required this.pageCount,
    required this.rowMin,
    required this.list,
    required this.rowMax,
  });

  @override
  List<Object?> get props => [
    totalCount,
    pageNum,
    pageCount,
    rowMin,
    ...list,
    rowMax,
  ];
}
