import 'package:flutter/material.dart';
import 'package:locator_app/home/home.dart';
import 'package:locator_app/landing/landing.dart';

class AppRouter {
  static const homeRoute = 'home';
  static const landingRoute = 'landing';

  static Route<String>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );

      case landingRoute:
        return MaterialPageRoute(
          builder: (context) => const LandingScreen(),
        );
    }
    return null;
  }
}
