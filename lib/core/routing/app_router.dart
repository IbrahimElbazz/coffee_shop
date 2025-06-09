import 'package:coffee_shop/core/routing/routes.dart';
import 'package:coffee_shop/features/splash/splash.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const Splash());
      default:
        return null;
    }
  }
}
