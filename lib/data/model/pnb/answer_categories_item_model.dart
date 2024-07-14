import 'package:hsg_loyalty/data/model/pnb/children_item_model.dart';
import 'package:hsg_loyalty/domain/entity/pnb/answer_categories_item_entity.dart';
import 'package:hsg_loyalty/domain/entity/pnb/children_item_entity.dart';

class AnswerCategoriesItemModel extends AnswerCategoriesItemEntity {
  const AnswerCategoriesItemModel({
    required List<ChildrenItemEntity> children,
    required String code,
    required String name,
    required String backgroundColor,
  }) : super(
    children: children,
    code: code,
    name: name,
    backgroundColor: backgroundColor,
  );

  factory AnswerCategoriesItemModel.fromJson(Map<String, dynamic> json) {
    return AnswerCategoriesItemModel(
      children: List<ChildrenItemEntity>.from(
          json['Children'].map((item) => ChildrenItemModel.fromJson(item))),
      code: json['Code'],
      name: json['Name'],
      backgroundColor: json['BackgroundColor'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Children': children.map((item) => (item as ChildrenItemModel).toJson()).toList(),
      'Code': code,
      'Name': name,
      'BackgroundColor': backgroundColor,
    };
  }

  factory AnswerCategoriesItemModel.fromEntity(AnswerCategoriesItemEntity entity) {
    return AnswerCategoriesItemModel(
      children: entity.children,
      code: entity.code,
      name: entity.name,
      backgroundColor: entity.backgroundColor,
    );
  }
}