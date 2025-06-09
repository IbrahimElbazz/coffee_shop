import 'package:coffee_shop/core/routing/animation_route.dart';
import 'package:coffee_shop/core/routing/routes.dart';
import 'package:coffee_shop/features/login/ui/screens/login_screen.dart';
import 'package:coffee_shop/features/onboarding/ui/onboarding_1.dart';
import 'package:coffee_shop/features/onboarding/ui/onboarding_2.dart';
import 'package:coffee_shop/features/onboarding/ui/onboarding_3.dart';
import 'package:coffee_shop/features/splash/splash.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const Splash());
      case Routes.onboarding_1:
        return AppHelperFunctions().fadeTransition(page: const Onboarding1());
      case Routes.onboarding_2:
        return AppHelperFunctions().fadeTransition(page: const Onboarding2());
      case Routes.onboarding_3:
        return AppHelperFunctions().fadeTransition(page: const Onboarding3());
      case Routes.login:
        return AppHelperFunctions().fadeTransition(page: const LoginScreen());
      default:
        return null;
    }
  }
}
