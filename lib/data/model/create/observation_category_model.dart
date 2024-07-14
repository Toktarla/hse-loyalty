import '../../../domain/entity/create/observation_category_entity.dart';

class ObservationCategoryModel extends ObservationCategoryEntity {
   ObservationCategoryModel({
    required bool isSelected,
    required int id,
    required String name,
  }) : super(
    isSelected: isSelected,
    id: id,
    name: name,
  );

  factory ObservationCategoryModel.fromJson(Map<String, dynamic> json) {
    return ObservationCategoryModel(
      isSelected: json['IsSelected'],
      id: json['Id'],
      name: json['Name'],
    );
  }
}