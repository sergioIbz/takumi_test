import 'package:takumi_test/domain/entities/news_entity.dart';
import 'package:takumi_test/infrastructure/models/news/news_news_api.dart';

class NewsMapper {
  static NewsEntity newsApitoEntity(NewsNewsApi newsApi) {
    const String noData = 'no-data';
    const notImageFound =
        'https://ih1.redbubble.net/image.4905811447.8675/flat,750x,075,f-pad,750x1000,f8f8f8.jpg';
    return NewsEntity(
      author: newsApi.author ?? noData,
      title: newsApi.title,
      description: newsApi.description,
      url: newsApi.url,
      urlToImage: newsApi.urlToImage ?? notImageFound,
      publishedAt: newsApi.publishedAt,
      content: newsApi.content ?? noData,
    );
  }
}
