import 'package:hsg_loyalty/data/model/questionnaires/questionnaire_item_model.dart';

import '../../../domain/entity/questionnaires/questionnaire_form_entity.dart';

class QuestionnaireFormModel extends QuestionnaireFormEntity {
  const QuestionnaireFormModel({
    required String organizationName,
    required int? type,
    required String description,
    required String username,
    required List<QuestionsItemModel> questions,
    required int? id,
    required String name,
  }) : super(
    organizationName: organizationName,
    type: type,
    description: description,
    username: username,
    questions: questions,
    id: id,
    name: name,
  );

  factory QuestionnaireFormModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> jsonQuestions = json['Questions'];
    final List<QuestionsItemModel> questions = jsonQuestions
        .map((questionJson) => QuestionsItemModel.fromJson(questionJson))
        .toList();

    return QuestionnaireFormModel(
      organizationName: json['OrganizationName'] ?? '',
      type: json['Type'],
      description: json['Description'] ?? '',
      username: json['Username'] ?? '',
      questions: questions,
      id: json['Id'],
      name: json['Name'] ?? '',
    );
  }

  QuestionnaireFormEntity toEntity() {
    return QuestionnaireFormEntity(
        organizationName: organizationName,
        type: type,
        description: description,
        username: username,
        questions: questions,
        id: id,
        name: name
    );
  }

  Map<String, dynamic> toJson() {
    final List<Map<String, dynamic>> jsonQuestions =
    questions.map((question) => question.toJson()).toList();

    return {
      'OrganizationName': organizationName,
      'Type': type,
      'Description': description,
      'Username': username,
      'Questions': jsonQuestions,
      'Id': id,
      'Name': name,
    };
  }


}
