import 'package:takumi_test/domain/datasources/news_api_datasource.dart';
import 'package:takumi_test/domain/entities/news_entity.dart';
import 'package:takumi_test/domain/repositories/news_repository.dart';

class NewsRepositoryImpl extends NewsRepository {
  final NewsApiDatasource newsApiDatasource;

  NewsRepositoryImpl(this.newsApiDatasource);

  @override
  Future<List<NewsEntity>> getTopHeadlines({int page = 1}) {
    return newsApiDatasource.getTopHeadlines(
      page: page,
    );
  }
}
