import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppThemeMode { light, dark, system, sea }

class ThemeController extends StateNotifier<AppThemeMode> {
  static const _key = 'app_theme_mode';
  final SharedPreferences _prefs;

  ThemeController(this._prefs) : super(AppThemeMode.system) {
    _load();
  }

  void _load() {
    final saved = _prefs.getString(_key);
    if (saved != null) {
      state = AppThemeMode.values.firstWhere(
        (e) => e.name == saved,
        orElse: () => AppThemeMode.system,
      );
    }
  }

  void setTheme(AppThemeMode mode) {
    state = mode;
    _prefs.setString(_key, mode.name);
  }

  ThemeMode get themeMode {
    switch (state) {
      case AppThemeMode.light:
        return ThemeMode.light;
      case AppThemeMode.dark:
      case AppThemeMode.sea:
        return ThemeMode.dark; // Sea is a dark variant
      case AppThemeMode.system:
        return ThemeMode.system;
    }
  }
}

final sharedPrefsProvider = Provider<SharedPreferences>((ref) => throw UnimplementedError());

final themeControllerProvider = StateNotifierProvider<ThemeController, AppThemeMode>((ref) {
  final prefs = ref.watch(sharedPrefsProvider);
  return ThemeController(prefs);
});
