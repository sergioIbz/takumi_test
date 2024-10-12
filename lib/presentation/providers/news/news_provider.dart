import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takumi_test/domain/entities/news_entity.dart';
import 'package:takumi_test/presentation/providers/news/news_repository_provider.dart';

final topHeadlinesNewsProvider =
    StateNotifierProvider<NewsNotifier, List<NewsEntity>>(
  (ref) {
    final fetchMoreNews = ref
        .watch(
          newsRepositoryProvider,
        )
        .getTopHeadlines;
    return NewsNotifier(
      fetchMoreNews: fetchMoreNews,
    );
  },
);

typedef NewsCallback = Future<List<NewsEntity>> Function({int page});

class NewsNotifier extends StateNotifier<List<NewsEntity>> {
  int currentPage = 0;
  NewsCallback fetchMoreNews;
  NewsNotifier({
    required this.fetchMoreNews,
  }) : super(
          [],
        );

  Future<void> loadNextPage() async {
    currentPage++;
    final List<NewsEntity> movies = await fetchMoreNews(
      page: currentPage,
    );
    state = [
      ...state,
      ...movies,
    ];
  }
}
