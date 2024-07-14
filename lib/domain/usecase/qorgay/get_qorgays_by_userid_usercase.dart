import '../../../utils/resources/data_state.dart';
import '../../../utils/helpers/usecase_helper.dart';
import '../../entity/list/qorgay_entity.dart';
import '../../repository/qorgay_repository.dart';

class GetQorgaysByUseridUsercase implements UseCase<DataState<List<QorgayEntity>>, int> {
  final QorgayRepository _qorgayRepository;

  GetQorgaysByUseridUsercase(this._qorgayRepository);

  @override
  Future<DataState<List<QorgayEntity>>> call({int? params}) {
    return _qorgayRepository.getQorgaysByUserId(params!);
  }


}