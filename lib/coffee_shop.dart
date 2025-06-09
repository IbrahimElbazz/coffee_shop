import 'package:coffee_shop/core/routing/app_router.dart';
import 'package:coffee_shop/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoffeeShop extends StatelessWidget {
  const CoffeeShop({super.key});

  @override
  Widget build(BuildContext context) {
    final AppRouter appRouter = AppRouter();
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Coffe Shop',
          onGenerateRoute: appRouter.generateRoute,
          initialRoute: Routes.splash,
        );
      },
    );
  }
}
