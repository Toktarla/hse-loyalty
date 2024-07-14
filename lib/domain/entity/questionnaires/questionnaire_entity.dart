import 'package:equatable/equatable.dart';

class QuestionnaireEntity extends Equatable {
  final String type;
  final String description;
  final String insertDate;
  final bool isPassed;
  final int id;
  final String name;

  const QuestionnaireEntity({
    required this.type,
    required this.description,
    required this.insertDate,
    required this.isPassed,
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [type, description, insertDate, isPassed, id, name];
}
