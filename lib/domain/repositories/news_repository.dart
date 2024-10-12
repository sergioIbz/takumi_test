import '../entities/news_entity.dart';

abstract class NewsRepository {
  Future<List<NewsEntity>> getTopHeadlines({int page = 1});
}
