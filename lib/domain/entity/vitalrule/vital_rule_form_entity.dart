import 'package:equatable/equatable.dart';
import 'package:hsg_loyalty/domain/entity/vitalrule/user_answers_dto_entity.dart';
import 'answers_dto_entity.dart';
import 'comments_dto_entity.dart';
import 'files_dto_entity_entity.dart';

class VitalRuleFormEntity extends Equatable {
  final List<UserAnswersDtoEntity>? data;
  final int? page;
  final int? count;
  final List<int>? pagination;
  final bool? getAll;

  const VitalRuleFormEntity({
  required this.data,
  required this.page,
  required this.count,
  required this.pagination,
  required this.getAll,
  });

  @override
  List<Object?> get props => [data,page,count,pagination,getAll];

}