import 'package:hsg_loyalty/data/model/questionnaires/answer_variants_model.dart';
import '../../../domain/entity/questionnaires/questions_item_entity.dart';

// ignore: must_be_immutable
class QuestionsItemModel extends QuestionsItemEntity {
  QuestionsItemModel({
    required int? type,
    required List<AnswerVariantsItemModel>? answerVariants,
    required String text,
    required int? id,
    int? selectedAnswer = 0,
  }) : super(
    type: type,
    answerVariants: answerVariants,
    text: text,
    id: id,
    selectedAnswer: selectedAnswer,
  );

  factory QuestionsItemModel.fromJson(Map<String, dynamic> json) {
    return QuestionsItemModel(
      type: json['Type'],
      answerVariants: (json['AnswerVariants'] as List<dynamic>?)
          ?.map((item) => AnswerVariantsItemModel.fromJson(item))
          .toList(),
      text: json['Text'],
      id: json['Id'],
      selectedAnswer: json['SelectedAnswer'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final List<Map<String, dynamic>> jsonAnswerVariants =
        answerVariants?.map((variant) => variant.toJson()).toList() ?? [];

    return {
      'Type': type,
      'AnswerVariants': jsonAnswerVariants,
      'Text': text,
      'Id': id,
      'SelectedAnswer': selectedAnswer,
    };
  }
}
