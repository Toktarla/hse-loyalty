// AnswersDto class
import 'package:equatable/equatable.dart';
import 'package:hsg_loyalty/data/model/vitalrules/answers_dto_model.dart';

class AnswersDtoEntity extends Equatable {
  final String question;
  final String answer;

  const AnswersDtoEntity({
    required this.question,
    required this.answer,
  });

  AnswersDtoModel toModel() {
    return AnswersDtoModel(
      question: question,
      answer: answer,
    );
  }

@override
  List<Object?> get props => [
    question,
    answer,
  ];

  @override
  String toString() {
    return 'AnswersDto { question: $question, answer: $answer }';
  }
}