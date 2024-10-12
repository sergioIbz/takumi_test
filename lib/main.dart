import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takumi_test/config/router/app_router.dart';
import 'package:takumi_test/config/theme/app_theme.dart';
import 'package:takumi_test/presentation/providers/theme_provider/theme_provider.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(isDarkModeProvider);
    return MaterialApp.router(
      theme: AppTheme(
        isDarkmode: isDarkMode,
      ).getTheme(),
      routerConfig: appRouter,
    );
  }
}
