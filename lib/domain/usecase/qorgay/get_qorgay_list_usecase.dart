import '../../../utils/resources/data_state.dart';
import '../../../utils/helpers/usecase_helper.dart';
import '../../entity/list/qorgay_entity.dart';
import '../../repository/qorgay_repository.dart';

class GetQorgayListUseCase implements UseCase<DataState<List<QorgayEntity>>, void> {
  final QorgayRepository _qorgayRepository;

  GetQorgayListUseCase(this._qorgayRepository);

  @override
  Future<DataState<List<QorgayEntity>>> call({void params}) {
    return _qorgayRepository.getQorgayList();
  }


}