import 'package:equatable/equatable.dart';
import 'package:hsg_loyalty/domain/entity/pnb/answer_categories_item_entity.dart';

import '../../../../data/model/pnb/answer_categories_item_model.dart';

class PnbWorkObservationFormEntity extends Equatable {
  final String? task;
  final String? dateObservation;
  final String? date;
  final String? time;
  final int? organizationDepartmentId;
  final int? category5;
  final int? category4;
  final int? category3;
  final int? category2;
  final int? category1;
  final String? comment24;
  final String? comment23;
  final int? category9;
  final int? category8;
  final int? category7;
  final int? category6;
  final int? peopleCount;
  final String? comment1;
  final int? placeId;
  final String? comment2;
  final String? authorOrganizationName;
  final String? comment5;
  final int? category10;
  final String? comment6;
  final String? comment3;
  final int? category12;
  final String? comment4;
  final int? category11;
  final String? comment9;
  final String? comment7;
  final String? comment8;
  final int? authorOrganizationId;
  final int? placeItemId;
  final int? id;
  final String? authorFullname;
  final int? category21;
  final int? category20;
  final int? category23;
  final int? category22;
  final String? comment11;
  final int? organizationId;
  final String? comment10;
  final int? category14;
  final int? category13;
  final int? category16;
  final int? category15;
  final int? category18;
  final int? category17;
  final int? category19;
  final String? comment20;
  final String? comment22;
  final String? comment21;
  final int? authorOrganizationDepartmentId;
  final String? comment17;
  final String? comment16;
  final String? comment19;
  final String? comment18;
  final String? comment13;
  final String? comment12;
  final String? comment15;
  final String? comment14;
  final String? authorOrganizationDepartmentName;
  final int? category24;
  final List<AnswerCategoriesItemModel>? answerCategories;

  const PnbWorkObservationFormEntity({
     this.task,
     this.dateObservation,
     this.date,
     this.time,
     this.organizationDepartmentId,
     this.category5,
     this.category4,
     this.category3,
     this.category2,
     this.category1,
     this.comment24,
     this.comment23,
     this.category9,
     this.category8,
     this.category7,
     this.category6,
     this.peopleCount,
     this.comment1,
     this.placeId,
     this.comment2,
     this.authorOrganizationName,
     this.comment5,
     this.category10,
     this.comment6,
     this.comment3,
     this.category12,
     this.comment4,
     this.category11,
     this.comment9,
     this.comment7,
     this.comment8,
     this.authorOrganizationId,
     this.placeItemId,
     this.id,
     this.authorFullname,
     this.category21,
     this.category20,
     this.category23,
     this.category22,
     this.comment11,
     this.organizationId,
     this.comment10,
     this.category14,
     this.category13,
     this.category16,
     this.category15,
     this.category18,
     this.category17,
     this.category19,
     this.comment20,
     this.comment22,
     this.comment21,
     this.authorOrganizationDepartmentId,
     this.comment17,
     this.comment16,
     this.comment19,
     this.comment18,
     this.comment13,
     this.comment12,
     this.comment15,
     this.comment14,
     this.authorOrganizationDepartmentName,
     this.category24,
     this.answerCategories,
  });

  factory PnbWorkObservationFormEntity.fromJson(Map<String, dynamic> json) {
    return PnbWorkObservationFormEntity(
      task: json['Task'],
      dateObservation: json['DateObservation'],
      date: json['Date'],
      time: json['Time'],
      organizationDepartmentId: json['OrganizationDepartmentId'],
      category5: json['Category5'],
      category4: json['Category4'],
      category3: json['Category3'],
      category2: json['Category2'],
      category1: json['Category1'],
      comment24: json['Comment24'],
      comment23: json['Comment23'],
      category9: json['Category9'],
      category8: json['Category8'],
      category7: json['Category7'],
      category6: json['Category6'],
      peopleCount: json['PeopleCount'],
      comment1: json['Comment1'],
      placeId: json['PlaceId'],
      comment2: json['Comment2'],
      authorOrganizationName: json['AuthorOrganizationName'],
      comment5: json['Comment5'],
      category10: json['Category10'],
      comment6: json['Comment6'],
      comment3: json['Comment3'],
      category12: json['Category12'],
      comment4: json['Comment4'],
      category11: json['Category11'],
      comment9: json['Comment9'],
      comment7: json['Comment7'],
      comment8: json['Comment8'],
      authorOrganizationId: json['AuthorOrganizationId'],
      placeItemId: json['PlaceItemId'],
      id: json['Id'],
      authorFullname: json['AuthorFullname'],
      category21: json['Category21'],
      category20: json['Category20'],
      category23: json['Category23'],
      category22: json['Category22'],
      comment11: json['Comment11'],
      organizationId: json['OrganizationId'],
      comment10: json['Comment10'],
      category14: json['Category14'],
      category13: json['Category13'],
      category16: json['Category16'],
      category15: json['Category15'],
      category18: json['Category18'],
      category17: json['Category17'],
      category19: json['Category19'],
      comment20: json['Comment20'],
      comment22: json['Comment22'],
      comment21: json['Comment21'],
      authorOrganizationDepartmentId: json['AuthorOrganizationDepartmentId'],
      comment17: json['Comment17'],
      comment16: json['Comment16'],
      comment19: json['Comment19'],
      comment18: json['Comment18'],
      comment13: json['Comment13'],
      comment12: json['Comment12'],
      comment15: json['Comment15'],
      comment14: json['Comment14'],
      authorOrganizationDepartmentName: json['AuthorOrganizationDepartmentName'],
      category24: json['Category24'],
      answerCategories: (json['AnswerCategories'] as List)
          .map((e) => AnswerCategoriesItemModel.fromJson(e))
          .toList(),
    );
  }

  PnbWorkObservationFormEntity copyWith({
    String? task,
    String? dateObservation,
    String? date,
    String? time,
    int? organizationDepartmentId,
    int? category5,
    int? category4,
    int? category3,
    int? category2,
    int? category1,
    String? comment24,
    String? comment23,
    int? category9,
    int? category8,
    int? category7,
    int? category6,
    int? peopleCount,
    String? comment1,
    int? placeId,
    String? comment2,
    String? authorOrganizationName,
    String? comment5,
    int? category10,
    String? comment6,
    String? comment3,
    int? category12,
    String? comment4,
    int? category11,
    String? comment9,
    String? comment7,
    String? comment8,
    int? authorOrganizationId,
    int? placeItemId,
    int? id,
    String? authorFullname,
    int? category21,
    int? category20,
    int? category23,
    int? category22,
    String? comment11,
    int? organizationId,
    String? comment10,
    int? category14,
    int? category13,
    int? category16,
    int? category15,
    int? category18,
    int? category17,
    int? category19,
    String? comment20,
    String? comment22,
    String? comment21,
    int? authorOrganizationDepartmentId,
    String? comment17,
    String? comment16,
    String? comment19,
    String? comment18,
    String? comment13,
    String? comment12,
    String? comment15,
    String? comment14,
    String? authorOrganizationDepartmentName,
    int? category24,
    List<AnswerCategoriesItemModel>? answerCategories,
  }) {
    return PnbWorkObservationFormEntity(
      task: task ?? this.task,
      dateObservation: dateObservation ?? this.dateObservation,
      date: date ?? this.date,
      time: time ?? this.time,
      organizationDepartmentId: organizationDepartmentId ?? this.organizationDepartmentId,
      category5: category5 ?? this.category5,
      category4: category4 ?? this.category4,
      category3: category3 ?? this.category3,
      category2: category2 ?? this.category2,
      category1: category1 ?? this.category1,
      comment24: comment24 ?? this.comment24,
      comment23: comment23 ?? this.comment23,
      category9: category9 ?? this.category9,
      category8: category8 ?? this.category8,
      category7: category7 ?? this.category7,
      category6: category6 ?? this.category6,
      peopleCount: peopleCount ?? this.peopleCount,
      comment1: comment1 ?? this.comment1,
      placeId: placeId ?? this.placeId,
      comment2: comment2 ?? this.comment2,
      authorOrganizationName: authorOrganizationName ?? this.authorOrganizationName,
      comment5: comment5 ?? this.comment5,
      category10: category10 ?? this.category10,
      comment6: comment6 ?? this.comment6,
      comment3: comment3 ?? this.comment3,
      category12: category12 ?? this.category12,
      comment4: comment4 ?? this.comment4,
      category11: category11 ?? this.category11,
      comment9: comment9 ?? this.comment9,
      comment7: comment7 ?? this.comment7,
      comment8: comment8 ?? this.comment8,
      authorOrganizationId: authorOrganizationId ?? this.authorOrganizationId,
      placeItemId: placeItemId ?? this.placeItemId,
      id: id ?? this.id,
      authorFullname: authorFullname ?? this.authorFullname,
      category21: category21 ?? this.category21,
      category20: category20 ?? this.category20,
      category23: category23 ?? this.category23,
      category22: category22 ?? this.category22,
      comment11: comment11 ?? this.comment11,
      organizationId: organizationId ?? this.organizationId,
      comment10: comment10 ?? this.comment10,
      category14: category14 ?? this.category14,
      category13: category13 ?? this.category13,
      category16: category16 ?? this.category16,
      category15: category15 ?? this.category15,
      category18: category18 ?? this.category18,
      category17: category17 ?? this.category17,
      category19: category19 ?? this.category19,
      comment20: comment20 ?? this.comment20,
      comment22: comment22 ?? this.comment22,
      comment21: comment21 ?? this.comment21,
      authorOrganizationDepartmentId: authorOrganizationDepartmentId ?? this.authorOrganizationDepartmentId,
      comment17: comment17 ?? this.comment17,
      comment16: comment16 ?? this.comment16,
      comment19: comment19 ?? this.comment19,
      comment18: comment18 ?? this.comment18,
      comment13: comment13 ?? this.comment13,
      comment12: comment12 ?? this.comment12,
      comment15: comment15 ?? this.comment15,
      comment14: comment14 ?? this.comment14,
      authorOrganizationDepartmentName: authorOrganizationDepartmentName ?? this.authorOrganizationDepartmentName,
      category24: category24 ?? this.category24,
      answerCategories: answerCategories ?? this.answerCategories,
    );
  }


  @override
  List<Object?> get props => [
    task,
    dateObservation,
    date,
    time,
    organizationDepartmentId,
    category5,
    category4,
    category3,
    category2,
    category1,
    comment24,
    comment23,
    category9,
    category8,
    category7,
    category6,
    peopleCount,
    comment1,
    placeId,
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
    placeItemId,
    id,
    authorFullname,
    category21,
    category20,
    category23,
    category22,
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
    comment20,
    comment22,
    comment21,
    authorOrganizationDepartmentId,
    comment17,
    comment16,
    comment19,
    comment18,
    comment13,
    comment12,
    comment15,
    comment14,
    authorOrganizationDepartmentName,
    category24,
    answerCategories,
  ];
}

