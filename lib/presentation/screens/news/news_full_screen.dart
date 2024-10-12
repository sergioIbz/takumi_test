import 'package:flutter/material.dart';
import 'package:takumi_test/domain/entities/news_entity.dart';
import 'package:takumi_test/infrastructure/mappers/time_format.dart';

class NewsFullScreen extends StatelessWidget {
  static const name = 'news-full-screen';
  final NewsEntity newsEntity;
  const NewsFullScreen(this.newsEntity, {super.key});

  @override
  Widget build(BuildContext context) {
    final titleTheme = Theme.of(context).textTheme.titleMedium;
    final themeData = Theme.of(context).colorScheme;
    const padding = EdgeInsets.symmetric(horizontal: 16);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'NewsApi',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              newsEntity.urlToImage,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 15),
            Padding(
              padding: padding,
              child: Text(
                newsEntity.title,
                style: titleTheme,
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: padding,
              child: Expanded(
                child: Row(
                  children: [
                    Icon(
                      Icons.edit,
                      color: themeData.primary,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        newsEntity.author,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      formatDateTime(newsEntity.publishedAt),
                      style: TextStyle(
                        color: themeData.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            if (newsEntity.description != 'no-data')
              Padding(
                padding: padding,
                child: Text(newsEntity.description),
              ),
            const SizedBox(
              height: 20,
            ),
            if (newsEntity.content != 'no-data')
              Padding(
                padding: padding,
                child: Text(newsEntity.content),
              ),
          ],
        ),
      ),
    );
  }
}
