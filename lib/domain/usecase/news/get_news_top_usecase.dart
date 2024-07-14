

import 'package:hsg_loyalty/domain/entity/home/news_top_entity.dart';
import 'package:hsg_loyalty/domain/repository/news_repository.dart';
import 'package:hsg_loyalty/utils/resources/data_state.dart';
import 'package:hsg_loyalty/utils/helpers/usecase_helper.dart';

class GetNewsTopUseCase extends UseCase<DataState<NewsTopEntity>,void> {

  final NewsRepository _newsRepository;

  GetNewsTopUseCase(this._newsRepository);

  @override
  Future<DataState<NewsTopEntity>> call({void params}) {
    return _newsRepository.getNewsTop();
  }



}