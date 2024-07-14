import 'package:equatable/equatable.dart';
import 'package:hsg_loyalty/data/model/questionnaires/questionnaire_form_model.dart';
import 'package:hsg_loyalty/domain/entity/questionnaires/questions_item_entity.dart';

class QuestionnaireFormEntity extends Equatable {
  final String organizationName;
  final int? type;
  final String description;
  final String username;
  final List<QuestionsItemEntity> questions;
  final int? id;
  final String name;

  const QuestionnaireFormEntity({
    required this.organizationName,
    required this.type,
    required this.description,
    required this.username,
    required this.questions,
    required this.id,
    required this.name,
  });

  QuestionnaireFormModel toModel() {
    return QuestionnaireFormModel(
        organizationName: organizationName,
        type: type,
        description: description,
        username: username,
        questions: questions.map((element) => element.toModel()).toList(),
        id: id,
        name: name);
  }

  @override
  List<Object?> get props => [
        organizationName,
        type,
        description,
        username,
        questions,
        id,
        name,
      ];
}
