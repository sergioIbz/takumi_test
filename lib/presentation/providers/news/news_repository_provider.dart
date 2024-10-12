import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../infrastructure/datasources/news_api_datasource_impl.dart';
import '../../../infrastructure/repositories/news_repository_impl.dart';

final newsRepositoryProvider = Provider(
  (ref) {
    return NewsRepositoryImpl(
      NewsApiDatasourceImpl(),
    );
  },
);
