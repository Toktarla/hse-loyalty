import 'package:equatable/equatable.dart';
import 'package:hsg_loyalty/data/model/vitalrules/comments_dto_model.dart';

class CommentsDtoEntity extends Equatable {
  final String? comment;
  final DateTime? date;
  final String? value;

  const CommentsDtoEntity({
     this.comment,
     this.date,
    this.value
  });

  CommentsDtoModel toModel() {
    return CommentsDtoModel(
        date: date ?? DateTime.now(),
        comment: comment ?? "",
        value: value ?? ''
    );
  }

  @override
  List<Object?> get props => [
    comment,
    date,
    value
  ];

  @override
  String toString() {
    return 'CommentsDto { comment: $comment, date: $date }';
  }
}