import 'package:hsg_loyalty/domain/entity/questionnaires/answer_variants_entity.dart';

class AnswerVariantsItemModel extends AnswerVariantsEntity {
  AnswerVariantsItemModel({
    required String text,
    required bool isSelected,
    required int id,
  }) : super(
    text: text,
    isSelected: isSelected,
    id: id,
  );

  factory AnswerVariantsItemModel.fromJson(Map<String, dynamic> json) {
    return AnswerVariantsItemModel(
      text: json['Text'] ?? "",
      isSelected: json['IsSelected'] ?? "",
      id: json['Id'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Text': text,
      'IsSelected': isSelected,
      'Id': id,
    };
  }
}
