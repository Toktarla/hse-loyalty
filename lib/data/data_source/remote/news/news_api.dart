import 'package:dio/dio.dart';
import 'package:hsg_loyalty/utils/constants/constants.dart';
import 'package:retrofit/retrofit.dart';

import '../../../model/home/news_model.dart';

part 'news_api.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class NewsApi {
  factory NewsApi(Dio dio) = _NewsApi;

  @GET("admin/news/list")
  Future<HttpResponse<List<NewsModel>>> getNews();

  @GET("admin/news/top")
  Future<HttpResponse<List<NewsTopModel>>> getNewsTop();
}
