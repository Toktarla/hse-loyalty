import 'package:hsg_loyalty/utils/resources/data_state.dart';

import '../../../utils/helpers/usecase_helper.dart';
import '../../entity/create/departament_entity.dart';
import '../../repository/qorgay_repository.dart';

class GetDepartamentsUseCase implements UseCase<DataState<List<DepartmentEntity>>, int> {
  final QorgayRepository _qorgayRepository;

  GetDepartamentsUseCase(this._qorgayRepository);

  @override
  Future<DataState<List<DepartmentEntity>>> call({int? params}) {
    return _qorgayRepository.getDepartments(params!);
  }
}