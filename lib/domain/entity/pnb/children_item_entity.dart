import 'package:equatable/equatable.dart';

class ChildrenItemEntity extends Equatable {
  final dynamic children;
  final String code;
  final String name;
  final dynamic backgroundColor;
  final String? comment;
  final int? category;

  const ChildrenItemEntity({
    required this.children,
    required this.code,
    required this.name,
    required this.backgroundColor,
    this.comment,
    this.category,
  });

  @override
  List<Object?> get props => [children, code, name, backgroundColor, comment, category];

}
