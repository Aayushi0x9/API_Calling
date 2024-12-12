import 'package:api_calling/screens/geminii/gemini_screen.dart';
import 'package:api_calling/screens/home/home_screen.dart';
import 'package:api_calling/screens/translate/translate_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  AppRoutes._();
  static final AppRoutes appRoutes = AppRoutes._();

  static String homepage = '/homePage';
  static String translate = '/translate';
  static String geminii = '/geminii';

  static Map<String, WidgetBuilder> routes = {
    AppRoutes.homepage: (context) => const HomeScreen(),
    AppRoutes.translate: (context) => const TranslateScreen(),
    AppRoutes.geminii: (context) => const GeminiScreen(),
  };
}
