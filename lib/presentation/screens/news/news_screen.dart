import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/news/news_provider.dart';
import '../../providers/theme_provider/theme_provider.dart';
import '../../widgets/news/news_post.dart';

class NewsScreen extends StatelessWidget {
  static const name = 'news-screen';
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _NewsView();
  }
}

class _NewsView extends ConsumerStatefulWidget {
  const _NewsView();

  @override
  _NewsViewState createState() => _NewsViewState();
}

class _NewsViewState extends ConsumerState<_NewsView> {
  @override
  void initState() {
    super.initState();

    ref.read(topHeadlinesNewsProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final listMovies = ref.watch(topHeadlinesNewsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'NewsApi',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(isDarkModeProvider.notifier).update(
                    (state) => !state,
                  );
            },
            icon: Icon(ref.watch(isDarkModeProvider)
                ? Icons.dark_mode_outlined
                : Icons.light_mode_outlined),
          )
        ],
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: listMovies.length,
          itemBuilder: (context, index) => NewsPost(
            listMovies[index],
          ),
        ),
      ),
    );
  }
}
