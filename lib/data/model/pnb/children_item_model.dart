import 'package:hsg_loyalty/domain/entity/pnb/children_item_entity.dart';

class ChildrenItemModel extends ChildrenItemEntity {
  const ChildrenItemModel({
    required dynamic children,
    required String code,
    required String name,
    required dynamic backgroundColor,
    String? comment,
    int? category,
  }) : super(
    children: children,
    code: code,
    name: name,
    backgroundColor: backgroundColor,
    comment: comment,
    category: category,
  );

  factory ChildrenItemModel.fromJson(Map<String, dynamic> json) {
    return ChildrenItemModel(
      children: json['Children'],
      code: json['Code'],
      name: json['Name'],
      backgroundColor: json['BackgroundColor'],
      comment: json['Comment'],
      category: json['Category'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Children': children,
      'Code': code,
      'Name': name,
      'BackgroundColor': backgroundColor,
      'Comment': comment,
      'Category': category,
    };
  }

  factory ChildrenItemModel.fromEntity(ChildrenItemEntity entity) {
    return ChildrenItemModel(
      children: entity.children,
      code: entity.code,
      name: entity.name,
      backgroundColor: entity.backgroundColor,
      comment: entity.comment,
      category: entity.category,
    );
  }
}