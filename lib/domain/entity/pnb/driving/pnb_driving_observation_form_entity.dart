import 'package:equatable/equatable.dart';

import '../../../../data/model/pnb/answer_categories_item_model.dart';
import '../answer_categories_item_entity.dart';

class PnbDrivingObservationFormEntity extends Equatable {
  final int organizationDepartmentId;
  final String endDate;
  final String endTime;
  final String startDate;
  final String startTime;
  final int category5;
  final int authorDrivingExperience;
  final int category4;
  final int category3;
  final int category2;
  final int category1;
  final int category9;
  final int category8;
  final int category7;
  final int category6;
  final String comment1;
  final String comment2;
  final String authorOrganizationName;
  final String comment5;
  final int category10;
  final String comment6;
  final String comment3;
  final int category12;
  final String comment4;
  final int category11;
  final String comment9;
  final String comment7;
  final String comment8;
  final int authorOrganizationId;
  final String id;
  final String authorFullname;
  final String comment11;
  final int organizationId;
  final String comment10;
  final int category14;
  final int category13;
  final int category16;
  final int category15;
  final int category18;
  final int category17;
  final int category19;
  final int authorOrganizationDepartmentId;
  final int drivingExperience;
  final String comment17;
  final String comment16;
  final String comment19;
  final String comment18;
  final String comment13;
  final String comment12;
  final String comment15;
  final String comment14;
  final String authorOrganizationDepartmentName;
  final List<AnswerCategoriesItemModel> answerCategories;
  final String location;

  const PnbDrivingObservationFormEntity({
    required this.organizationDepartmentId,
    required this.endDate,
    required this.endTime,
    required this.startDate,
    required this.startTime,
    required this.category5,
    required this.authorDrivingExperience,
    required this.category4,
    required this.category3,
    required this.category2,
    required this.category1,
    required this.category9,
    required this.category8,
    required this.category7,
    required this.category6,
    required this.comment1,
    required this.comment2,
    required this.authorOrganizationName,
    required this.comment5,
    required this.category10,
    required this.comment6,
    required this.comment3,
    required this.category12,
    required this.comment4,
    required this.category11,
    required this.comment9,
    required this.comment7,
    required this.comment8,
    required this.authorOrganizationId,
    required this.id,
    required this.authorFullname,
    required this.comment11,
    required this.organizationId,
    required this.comment10,
    required this.category14,
    required this.category13,
    required this.category16,
    required this.category15,
    required this.category18,
    required this.category17,
    required this.category19,
    required this.authorOrganizationDepartmentId,
    required this.drivingExperience,
    required this.comment17,
    required this.comment16,
    required this.comment19,
    required this.comment18,
    required this.comment13,
    required this.comment12,
    required this.comment15,
    required this.comment14,
    required this.authorOrganizationDepartmentName,
    required this.answerCategories,
    required this.location,
  });

  @override
  List<Object?> get props =>
      [
        organizationDepartmentId,
        endDate,
        endTime,
        startDate,
        startTime,
        category5,
        authorDrivingExperience,
        category4,
        category3,
        category2,
        category1,
        category9,
        category8,
        category7,
        category6,
        comment1,
        comment2,
        authorOrganizationName,
        comment5,
        category10,
        comment6,
        comment3,
        category12,
        comment4,
        category11,
        comment9,
        comment7,
        comment8,
        authorOrganizationId,
        id,
        authorFullname,
        comment11,
        organizationId,
        comment10,
        category14,
        category13,
        category16,
        category15,
        category18,
        category17,
        category19,
        authorOrganizationDepartmentId,
        drivingExperience,
        comment17,
        comment16,
        comment19,
        comment18,
        comment13,
        comment12,
        comment15,
        comment14,
        authorOrganizationDepartmentName,
        answerCategories,
        location,
      ];
}