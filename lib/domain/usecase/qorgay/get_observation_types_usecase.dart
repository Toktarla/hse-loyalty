import 'package:hsg_loyalty/domain/repository/qorgay_repository.dart';
import 'package:hsg_loyalty/utils/resources/data_state.dart';

import '../../../utils/helpers/usecase_helper.dart';
import '../../entity/create/observation_type_entity.dart';

class GetObservationTypesUseCase implements UseCase<DataState<List<ObservationTypeEntity>>, void> {
  final QorgayRepository _qorgayRepository;

  GetObservationTypesUseCase(this._qorgayRepository);

  @override
  Future<DataState<List<ObservationTypeEntity>>> call({void params}) {
    return _qorgayRepository.getObservationTypes();
  }


}
