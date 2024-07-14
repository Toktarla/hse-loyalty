import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hsg_loyalty/domain/entity/pnb/pnbwork/pnb_work_observation_form_entity.dart';

class PnbObservationCubit extends Cubit<PnbWorkObservationFormEntity> {
  PnbObservationCubit() : super(const PnbWorkObservationFormEntity());

  PnbWorkObservationFormEntity _accumulatedData = PnbWorkObservationFormEntity();

  PnbWorkObservationFormEntity get accumulatedData => _accumulatedData;

  void updateInput(PnbWorkObservationFormEntity updatedEntity) {
    _accumulatedData = _accumulatedData.copyWith(
      task: updatedEntity.task,
      dateObservation: updatedEntity.dateObservation,
      date: updatedEntity.date,
      time: updatedEntity.time,
      organizationDepartmentId: updatedEntity.organizationDepartmentId,
      category5: updatedEntity.category5,
      category4: updatedEntity.category4,
      category3: updatedEntity.category3,
      category2: updatedEntity.category2,
      category1: updatedEntity.category1,
      comment24: updatedEntity.comment24,
      comment23: updatedEntity.comment23,
      category9: updatedEntity.category9,
      category8: updatedEntity.category8,
      category7: updatedEntity.category7,
      category6: updatedEntity.category6,
      peopleCount: updatedEntity.peopleCount,
      comment1: updatedEntity.comment1,
      placeId: updatedEntity.placeId,
      comment2: updatedEntity.comment2,
      authorOrganizationName: updatedEntity.authorOrganizationName,
      comment5: updatedEntity.comment5,
      category10: updatedEntity.category10,
      comment6: updatedEntity.comment6,
      comment3: updatedEntity.comment3,
      category12: updatedEntity.category12,
      comment4: updatedEntity.comment4,
      category11: updatedEntity.category11,
      comment9: updatedEntity.comment9,
      comment7: updatedEntity.comment7,
      comment8: updatedEntity.comment8,
      authorOrganizationId: updatedEntity.authorOrganizationId,
      placeItemId: updatedEntity.placeItemId,
      id: updatedEntity.id,
      authorFullname: updatedEntity.authorFullname,
      category21: updatedEntity.category21,
      category20: updatedEntity.category20,
      category23: updatedEntity.category23,
      category22: updatedEntity.category22,
      comment11: updatedEntity.comment11,
      organizationId: updatedEntity.organizationId,
      comment10: updatedEntity.comment10,
      category14: updatedEntity.category14,
      category13: updatedEntity.category13,
      category16: updatedEntity.category16,
      category15: updatedEntity.category15,
      category18: updatedEntity.category18,
      category17: updatedEntity.category17,
      category19: updatedEntity.category19,
      comment20: updatedEntity.comment20,
      comment22: updatedEntity.comment22,
      comment21: updatedEntity.comment21,
      authorOrganizationDepartmentId: updatedEntity.authorOrganizationDepartmentId,
      comment17: updatedEntity.comment17,
      comment16: updatedEntity.comment16,
      comment19: updatedEntity.comment19,
      comment18: updatedEntity.comment18,
      comment13: updatedEntity.comment13,
      comment12: updatedEntity.comment12,
      comment15: updatedEntity.comment15,
      comment14: updatedEntity.comment14,
      authorOrganizationDepartmentName: updatedEntity.authorOrganizationDepartmentName,
      category24: updatedEntity.category24,
      answerCategories: updatedEntity.answerCategories,
    );

    emit(_accumulatedData);
  }


  void clearInput() {
    _accumulatedData = const PnbWorkObservationFormEntity();
    emit(_accumulatedData);
  }

  void printAccumulatedData() {
    print('PnbWorkObservationFormEntity:');

  }

}
