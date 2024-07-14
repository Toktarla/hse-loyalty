

import 'package:hsg_loyalty/domain/repository/news_repository.dart';
import 'package:hsg_loyalty/utils/helpers/usecase_helper.dart';

import '../../../utils/resources/data_state.dart';
import '../../entity/home/news_entity.dart';

class GetNewsUseCase extends UseCase<DataState<NewsEntity>,void> {

  final NewsRepository _newsRepository;

  GetNewsUseCase(this._newsRepository);

  @override
  Future<DataState<NewsEntity>> call({void params}) {
    return _newsRepository.getNews();
  }



}