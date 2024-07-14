import 'package:equatable/equatable.dart';
import 'package:hsg_loyalty/data/model/questionnaires/questionnaire_item_model.dart';

import 'answer_variants_entity.dart';

// ignore: must_be_immutable
class QuestionsItemEntity extends Equatable {
  final int? type;
  final List<AnswerVariantsEntity>? answerVariants;
  final String text;
  final int? id;
  int? selectedAnswer;

  QuestionsItemEntity({
    required this.type,
    required this.answerVariants,
    required this.text,
    required this.id,
    this.selectedAnswer = 0,
  });

  QuestionsItemModel toModel() {
    return QuestionsItemModel(
      type: type,
      answerVariants: answerVariants?.map((element) => element.toModel()).toList(),
      text: text,
      id: id,
      selectedAnswer: selectedAnswer
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Type': type,
      'AnswerVariants': answerVariants?.map((element) => element.toJson()).toList(),
      'Text': text,
      'Id': id,
      'SelectedAnswer': selectedAnswer,
    };
  }

  @override
  List<Object?> get props => [
    type,
    answerVariants,
    text,
    id,
    selectedAnswer,
  ];
}
