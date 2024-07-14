import 'package:hsg_loyalty/domain/repository/qorgay_repository.dart';
import 'package:hsg_loyalty/utils/resources/data_state.dart';

import '../../../utils/helpers/usecase_helper.dart';
import '../../entity/create/organization_entity.dart';

class GetOrganizationsUseCase implements UseCase<DataState<List<OrganizationEntity>>, void> {
  final QorgayRepository _qorgayRepository;

  GetOrganizationsUseCase(this._qorgayRepository);

  @override
  Future<DataState<List<OrganizationEntity>>> call({void params}) {
    return _qorgayRepository.getOrganizations();
  }


}
