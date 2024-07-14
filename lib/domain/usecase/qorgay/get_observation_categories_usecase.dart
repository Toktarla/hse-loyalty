import 'package:hsg_loyalty/domain/repository/qorgay_repository.dart';
import 'package:hsg_loyalty/utils/resources/data_state.dart';
import '../../../utils/helpers/usecase_helper.dart';
import '../../entity/create/observation_category_entity.dart';

class GetObservationCategoriesUseCase implements UseCase<DataState<List<ObservationCategoryEntity>>, void> {
  final QorgayRepository _qorgayRepository;

  GetObservationCategoriesUseCase(this._qorgayRepository);

  @override
  Future<DataState<List<ObservationCategoryEntity>>> call({void params}) {
    return _qorgayRepository.getObservationCategories();
  }


}
