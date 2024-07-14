import '../../../domain/entity/paging/paging_entity.dart';

class PagingModel<T> extends PagingEntity<T> {
  const PagingModel({
    required int totalCount,
    required int pageNum,
    required int pageCount,
    required int rowMin,
    required List<T> list,
    required int rowMax,
  }) : super(
    totalCount: totalCount,
    pageNum: pageNum,
    pageCount: pageCount,
    rowMin: rowMin,
    list: list,
    rowMax: rowMax,
  );

  factory PagingModel.fromJson(Map<String, dynamic> json, T Function(dynamic) fromJsonT) {
    return PagingModel(
      totalCount: json['totalCount'],
      pageNum: json['pageNum'],
      pageCount: json['pageCount'],
      rowMin: json['rowMin'],
      list: (json['list'] as List<dynamic>).map((item) => fromJsonT(item)).toList(),
      rowMax: json['rowMax'],
    );
  }

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T) toJsonT) {
    return {
      'totalCount': totalCount,
      'pageNum': pageNum,
      'pageCount': pageCount,
      'rowMin': rowMin,
      'list': list.map((item) => toJsonT(item)).toList(),
      'rowMax': rowMax,
    };
  }

  factory PagingModel.fromEntity(PagingEntity<T> entity) {
    return PagingModel(
      totalCount: entity.totalCount,
      pageNum: entity.pageNum,
      pageCount: entity.pageCount,
      rowMin: entity.rowMin,
      list: entity.list,
      rowMax: entity.rowMax,
    );
  }
}