import 'package:flutter/material.dart';
import 'package:locator_app/home/home.dart';

class AppRouter {
  static const homeRoute = 'home';

  static Route<String>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
    }
    return null;
  }
}
