import 'package:hsg_loyalty/domain/entity/home/news_entity.dart';
import 'package:hsg_loyalty/domain/entity/home/news_top_entity.dart';
import '../../utils/resources/data_state.dart';

abstract class NewsRepository {

  Future<DataState<NewsEntity>> getNews();

  Future<DataState<NewsTopEntity>> getNewsTop();

}


