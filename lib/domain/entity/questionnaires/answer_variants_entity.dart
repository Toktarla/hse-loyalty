import 'package:equatable/equatable.dart';
import 'package:hsg_loyalty/data/model/questionnaires/answer_variants_model.dart';

class AnswerVariantsEntity extends Equatable {
  final String text;
  final bool isSelected;
  final int id;

  const AnswerVariantsEntity({
    required this.text,
    required this.isSelected,
    required this.id,
  });

  AnswerVariantsItemModel toModel() {
    return AnswerVariantsItemModel(text: text, isSelected: isSelected, id: id);
  }
  Map<String, dynamic> toJson() {
    return {
      'Text': text,
      'IsSelected': isSelected,
      'Id': id,
    };
  }

  @override
  List<Object?> get props => [text, isSelected, id];
}
