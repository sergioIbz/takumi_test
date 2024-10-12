import '../entities/news_entity.dart';

abstract class NewsApiDatasource {
  Future<List<NewsEntity>> getTopHeadlines({int page = 1});
}
