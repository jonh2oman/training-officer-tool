import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'src/routing/app_router.dart';
import 'src/theme/app_theme.dart';
import 'src/theme/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  
  runApp(
    ProviderScope(
      overrides: [
        sharedPrefsProvider.overrideWithValue(prefs),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    final themeMode = ref.watch(themeControllerProvider);
    final themeNotifier = ref.watch(themeControllerProvider.notifier);

    return MaterialApp.router(
      title: 'Training Officer Tool',
      theme: AppTheme.lightTheme,
      darkTheme: themeMode == AppThemeMode.sea 
          ? AppTheme.seaTheme 
          : themeMode == AppThemeMode.army 
              ? AppTheme.armyTheme 
              : themeMode == AppThemeMode.air 
                  ? AppTheme.airTheme 
                  : AppTheme.darkTheme,
      themeMode: themeNotifier.themeMode,
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
