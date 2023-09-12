import 'package:flutter/material.dart';
import 'package:tc_app/src/di/app_injector.dart';
import 'package:tekflat_design/tekflat_design.dart';

abstract class ThemeState extends ChangeNotifier {
  static ThemeState get to => AppInjector.injector<ThemeState>();

  static final Map<ThemeMode, ThemeData> themes = {
    ThemeMode.light: TekThemes.light,
    ThemeMode.dark: TekThemes.dark,
  };

  ThemeState init();

  ThemeData get currentTheme;

  ThemeMode get currentThemeMode;

  void setCurrentTheme(ThemeMode appThemeMode);
}
