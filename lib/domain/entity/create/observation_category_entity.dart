import 'package:equatable/equatable.dart';

class ObservationCategoryEntity extends Equatable {
  final bool isSelected;
  final int id;
  final String name;

  ObservationCategoryEntity({
    required this.isSelected,
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [isSelected, id, name];
}
