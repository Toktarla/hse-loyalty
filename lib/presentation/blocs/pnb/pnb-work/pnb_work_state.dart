import 'package:hsg_loyalty/domain/entity/pnb/pnbwork/pnb_work_observation_entity.dart';
import 'package:hsg_loyalty/domain/entity/pnb/pnbwork/pnb_work_observation_form_entity.dart';

class PnbWorkState {

  final List<PnbWorkObservationEntity>? pnbWorkList;
  final PnbWorkObservationFormEntity? pnbWorkForm;
  final String? error;
  const PnbWorkState({
    this.pnbWorkList,
    this.pnbWorkForm,
    this.error
  });
}

class PnbWorkLaunching extends PnbWorkState {}

class PnbWorkLoading extends PnbWorkState {}

class SavePnbWorkDone extends PnbWorkState {}

class DeletePnbWorkDone extends PnbWorkState {}

class PnbWorkDone extends PnbWorkState {
  const PnbWorkDone({
    required List<PnbWorkObservationEntity>? pnbWorkList,
    required PnbWorkObservationFormEntity? pnbWorkForm,
  }) : super(pnbWorkList: pnbWorkList,pnbWorkForm: pnbWorkForm);
}

class PnbWorkError extends PnbWorkState {
  final String? error;
  const PnbWorkError({this.error});
}

