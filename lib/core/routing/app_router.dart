import 'package:coffee_shop/core/routing/animation_route.dart';
import 'package:coffee_shop/core/routing/routes.dart';
import 'package:coffee_shop/features/onboarding/ui/onboarding_1.dart';
import 'package:coffee_shop/features/splash/splash.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const Splash());
      case Routes.onboarding_1:
        return AppHelperFunctions().fadeTransition(page: const Onboarding1());
      default:
        return null;
    }
  }
}
