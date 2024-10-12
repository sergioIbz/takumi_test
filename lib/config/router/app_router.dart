import 'package:go_router/go_router.dart';
import 'package:takumi_test/domain/entities/news_entity.dart';
import 'package:takumi_test/presentation/screens/news/news_full_screen.dart';

import '../../presentation/screens/news/news_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/${NewsScreen.name}',
  routes: [
    GoRoute(
      path: '/${NewsScreen.name}',
      name: NewsScreen.name,
      builder: (context, state) => const NewsScreen(),
    ),
    GoRoute(
      path: '/${NewsFullScreen.name}',
      name: NewsFullScreen.name,
      builder: (context, state) => NewsFullScreen(
        state.extra as NewsEntity,
      ),
    ),
  ],
);
