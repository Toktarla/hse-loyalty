import 'package:hsg_loyalty/data/model/create/isSuccessResponse.dart';
import 'package:hsg_loyalty/domain/entity/create/create_qorgay_entity.dart';
import 'package:hsg_loyalty/domain/repository/qorgay_repository.dart';
import 'package:hsg_loyalty/utils/resources/data_state.dart';

import '../../../utils/helpers/usecase_helper.dart';

class AddQorgayUseCase implements UseCase<DataState<IsSuccessResponse>, CreateQorgayEntity> {
  final QorgayRepository _qorgayRepository;

  AddQorgayUseCase(this._qorgayRepository);

  @override
  Future<DataState<IsSuccessResponse>> call({CreateQorgayEntity? params}) {
    return _qorgayRepository.addQorgay(params!);
  }
}
