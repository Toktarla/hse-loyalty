import '../../../domain/entity/questionnaires/questionnaire_entity.dart';

class QuestionnaireModel extends QuestionnaireEntity {
  const QuestionnaireModel({
    required String type,
    required String description,
    required String insertDate,
    required bool isPassed,
    required int id,
    required String name,
  }) : super(
    type: type,
    description: description,
    insertDate: insertDate,
    isPassed: isPassed,
    id: id,
    name: name,
  );

  factory QuestionnaireModel.fromJson(Map<String, dynamic> json) {
    final data = json['List'] != null ? json['List'][0] : null;
    if (data != null) {
      return QuestionnaireModel(
        type: data['Type'],
        description: data['Description'],
        insertDate: data['InsertDate'],
        isPassed: data['IsPassed'],
        id: data['Id'],
        name: data['Name'],
      );
    } else {
      throw Exception('Invalid JSON structure for QuestionnaireModel');
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'Type': type,
      'Description': description,
      'InsertDate': insertDate,
      'IsPassed': isPassed,
      'Id': id,
      'Name': name,
    };
  }
}
