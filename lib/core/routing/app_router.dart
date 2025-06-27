import 'package:coffee_shop/core/routing/animation_route.dart';
import 'package:coffee_shop/core/routing/routes.dart';
import 'package:coffee_shop/features/Auth/login/logic/cubit/login_cubit.dart';
import 'package:coffee_shop/features/Auth/register/logic/cubit/register_cubit.dart';
import 'package:coffee_shop/features/Auth/login/ui/login_screen.dart';
import 'package:coffee_shop/features/Auth/register/ui/register_screen.dart';
import 'package:coffee_shop/features/account/logic/cubit/account_cubit.dart';
import 'package:coffee_shop/features/app_navigation/app_navigation.dart';
import 'package:coffee_shop/features/onboarding/ui/onboarding_1.dart';
import 'package:coffee_shop/features/onboarding/ui/onboarding_2.dart';
import 'package:coffee_shop/features/onboarding/ui/onboarding_3.dart';
import 'package:coffee_shop/features/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        return AppHelperFunctions().fadeTransition(
          page: BlocProvider(
            create: (context) => LoginCubit(),
            child: const LoginScreen(),
          ),
        );
      case Routes.register:
        return AppHelperFunctions().slideFromBottomTransition(
          page: BlocProvider(
            create: (context) => RegisterCubit(),
            child: const RegisterScreen(),
          ),
        );
      case Routes.appNavigation:
        return AppHelperFunctions().fadeTransition(
          page: BlocProvider(
            create: (context) => AccountCubit()..getInfo(),
            child: const AppNavigation(),
          ),
        );

      default:
        return null;
    }
  }
}
