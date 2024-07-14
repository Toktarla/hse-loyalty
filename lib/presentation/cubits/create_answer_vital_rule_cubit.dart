import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hsg_loyalty/domain/entity/vitalrule/answers_dto_entity.dart';
import 'package:hsg_loyalty/domain/entity/vitalrule/comments_dto_entity.dart';
import 'package:hsg_loyalty/domain/entity/vitalrule/user_answers_dto_entity.dart';

class CreateAnswerVitalRuleCubit extends Cubit<UserAnswersDtoEntity> {
  CreateAnswerVitalRuleCubit() : super(UserAnswersDtoEntity());

  UserAnswersDtoEntity _accumulatedData = const UserAnswersDtoEntity();

  UserAnswersDtoEntity get accumulatedData => _accumulatedData;

  void updateInput(UserAnswersDtoEntity updatedEntity) {
    _accumulatedData = _accumulatedData.copyWith(
      organizationId: updatedEntity.organizationId,
      id: updatedEntity.id,
      files: updatedEntity.files,
      comments: updatedEntity.comments,
      userAnswers: updatedEntity.userAnswers,
      fullName: updatedEntity.fullName,
      email: updatedEntity.email,
      nameOfContractOrganization: updatedEntity.nameOfContractOrganization,
      organizationName: updatedEntity.organizationName,
      placeOfInspection: updatedEntity.placeOfInspection,
      statusOfContractOrganization: updatedEntity.statusOfContractOrganization,
      structuralSubdivision: updatedEntity.structuralSubdivision,
      travelDate: updatedEntity.travelDate,
    );
    emit(_accumulatedData);
  }

  void updateUserAnswers(AnswersDtoEntity userAnswer) {
    List<AnswersDtoEntity> userAnswers = List.from(_accumulatedData.userAnswers ?? []);
    userAnswers.add(userAnswer);

    _accumulatedData = _accumulatedData.copyWith(
      userAnswers: userAnswers,
    );

    emit(_accumulatedData);
  }

  void updateComments(CommentsDtoEntity comment) {
    List<CommentsDtoEntity> comments = List.from(_accumulatedData.comments ?? []);
    comments.add(comment);

    _accumulatedData = _accumulatedData.copyWith(
      comments: comments,
    );

    emit(_accumulatedData);
  }

  void clearInput() {
    _accumulatedData = const UserAnswersDtoEntity();
    emit(_accumulatedData);
  }

  void printAccumulatedData() {
    print(_accumulatedData.toString());
  }
}
