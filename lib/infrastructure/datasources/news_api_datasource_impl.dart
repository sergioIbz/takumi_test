import 'package:dio/dio.dart';
import 'package:takumi_test/infrastructure/mappers/news_mapper.dart';
import 'package:takumi_test/infrastructure/models/news/news_response.dart';

import '../../config/constants/environment.dart';
import '../../domain/datasources/news_api_datasource.dart';
import '../../domain/entities/news_entity.dart';

class NewsApiDatasourceImpl implements NewsApiDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://newsapi.org/v2/',
      queryParameters: {
        'apiKey': Environment.apiKey,
        'country': 'us',
      },
    ),
  );

  @override
  Future<List<NewsEntity>> getTopHeadlines({int page = 1}) async {
    final response = await dio.get(
      'top-headlines',
      queryParameters: {
        'page': page,
      },
    );
    final data = NewsResponse.fromJson(response.data);
    final List<NewsEntity> newsList = data.articles
        .map(
          (news) => NewsMapper.newsApitoEntity(news),
        )
        .toList();

    return newsList;
  }
}
