import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/entities/news_entity.dart';
import '../../../infrastructure/mappers/time_format.dart';
import '../../screens/news/news_full_screen.dart';

class NewsPost extends StatelessWidget {
  final NewsEntity newsEntity;
  const NewsPost(this.newsEntity, {super.key});

  @override
  Widget build(BuildContext context) {
    final titleTheme = Theme.of(context).textTheme.titleMedium;
    final themeData = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 10),
      child: GestureDetector(
        onTap: () => context.pushNamed(
          NewsFullScreen.name,
          extra: newsEntity,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                newsEntity.urlToImage,
                height: 105,
                width: 95,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    newsEntity.title,
                    style: titleTheme,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    formatDateTime(newsEntity.publishedAt),
                    style: TextStyle(
                      color: themeData.primary,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
