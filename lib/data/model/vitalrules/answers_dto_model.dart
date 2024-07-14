import '../../../domain/entity/vitalrule/answers_dto_entity.dart';

class AnswersDtoModel extends AnswersDtoEntity {
  const AnswersDtoModel({
    required String question,
    required String answer,
  }) : super(
    question: question,
    answer: answer,
  );

  factory AnswersDtoModel.fromJson(Map<String, dynamic> json) {
    return AnswersDtoModel(
      question: json['Question'],
      answer: json['Answer'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'questionIndex': question,
      'answer': answer,
    };
  }

  AnswersDtoEntity toEntity() {
    return AnswersDtoEntity(
      question: question,
      answer: answer,
    );
  }
}
