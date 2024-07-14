import 'package:hsg_loyalty/data/model/vitalrules/user_answers_dto_model.dart';

import '../../../domain/entity/vitalrule/vital_rule_form_entity.dart';
import 'answers_dto_model.dart';

class VitalRuleFormModel extends VitalRuleFormEntity {
  const VitalRuleFormModel({
    required List<UserAnswersDtoModel>? data,
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

  factory VitalRuleFormModel.fromJson(Map<String, dynamic> json) {
    return VitalRuleFormModel(
      data: (json['Data'] as List)
          .map((e) => UserAnswersDtoModel.fromJson(e as Map<String, dynamic>))
          .toList() ?? [],
      page: json['Page'] ,
      count: json['Count'],
      pagination: List<int>.from(json['Pagination']),
      getAll: json['GetAll'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Data': data?.map((e) => (e as UserAnswersDtoModel).toJson()).toList() ?? [],
      'Page': page,
      'Count': count,
      'Pagination': pagination,
      'GetAll': getAll,
    };
  }

  VitalRuleFormEntity toEntity() {
    return VitalRuleFormEntity(
      data: data,
      page: page,
      count: count,
      pagination: pagination,
      getAll: getAll,
    );
  }
}
