

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hsg_loyalty/data/data_source/remote/news/news_api.dart';
import 'package:hsg_loyalty/domain/entity/home/news_entity.dart';
import 'package:hsg_loyalty/domain/entity/home/news_top_entity.dart';
import 'package:hsg_loyalty/domain/repository/news_repository.dart';
import 'package:hsg_loyalty/utils/resources/data_state.dart';

class NewsRepositoryImpl extends NewsRepository {
  final NewsApi _newsApi;

  NewsRepositoryImpl(this._newsApi);

  @override
  Future<DataState<NewsEntity>> getNews() async {
    try {
      final httpResponse = await _newsApi.getNews();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        final newsList = httpResponse.response.data.map((data) => data.toEntity()).toList();
        return DataSuccess(newsList);
      } else {
        return DataFailure(
          DioException(
            message: 'Error occurred in HTTP RESPONSE',
            error: 'Unknown error',
            response: httpResponse.response,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailure(e);
    }
  }

  @override
  Future<DataState<NewsTopEntity>> getNewsTop() async {
    try {
      final httpResponse = await _newsApi.getNewsTop();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        final newsTopList = httpResponse.response.data.map((data) => data.toEntity()).toList();
        return DataSuccess(newsTopList);
      } else {
        return DataFailure(
          DioException(
            message: 'Error occurred in HTTP RESPONSE',
            error: 'Unknown error',
            response: httpResponse.response,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailure(e);
    }
  }



}
