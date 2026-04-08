import 'package:apllication/presentation/pantallas/test_widgets.dart';
import 'package:flutter/material.dart';
import 'package:apllication/presentation/pantallas/home_screen.dart';

abstract class AppRoutes {
  AppRoutes._();
  static const String home = 'home';
  static const String widgets = 'widgets';
}

final Map<String, Widget Function(BuildContext)> appRoutes = {
  AppRoutes.home: (_) => const HomeScreen(),
  AppRoutes.widgets: (_) => const TestWidgetsScreen(),
};
