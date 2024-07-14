import 'package:equatable/equatable.dart';

import 'children_item_entity.dart';

class AnswerCategoriesItemEntity extends Equatable {
  final List<ChildrenItemEntity> children;
  final String code;
  final String name;
  final String backgroundColor;

  const AnswerCategoriesItemEntity({
    required this.children,
    required this.code,
    required this.name,
    required this.backgroundColor,
  });

  @override
  List<Object?> get props => [
    ...children,
    code,
    name,
    backgroundColor,
  ];
}
