
import '../../../domain/entity/vitalrule/comments_dto_entity.dart';

class CommentsDtoModel extends CommentsDtoEntity {
  const CommentsDtoModel({
    required String comment,
    required DateTime date,
    required String value
  }) : super(
    comment: comment,
    date: date,
    value: value
  );

  factory CommentsDtoModel.fromJson(Map<String, dynamic> json) {
    return CommentsDtoModel(
      comment: json['Comment'],
      date: DateTime.parse(json['Date']),
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': comment,
      'value': value,
    };
  }
}
