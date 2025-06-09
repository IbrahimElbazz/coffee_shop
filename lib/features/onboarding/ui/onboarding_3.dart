import 'package:coffee_shop/core/routing/extensions.dart';
import 'package:coffee_shop/core/routing/routes.dart';
import 'package:coffee_shop/core/theme/app_color.dart';
import 'package:coffee_shop/core/widgets/custom_button.dart';
import 'package:coffee_shop/core/widgets/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGroundOnboarding,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.transparent,
                    ),
                    onPressed: () {
                      context.pushNamedAndRemoveUntil(
                        Routes.login,
                        predicate: (route) => false,
                      );
                    },
                    child: Text(
                      'Skip',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF3C3C3C),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              GapH(height: 86),
              SizedBox(
                width: 255.w,
                height: 255.h,
                child: Image.asset('assets/image/onboarding_3.png'),
              ),
              GapH(height: 88),
              Text(
                textAlign: TextAlign.center,
                'Who doesn’t love rewards? We LOVE rewards!',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              GapH(height: 16),
              SizedBox(
                width: 291.w,
                child: Text(
                  'If you’re like us you love getting freebies and rewards! That’s why\nwe have the best reward program \nin the coffee game!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              GapH(height: 129),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset('assets/icons/loading_3.svg'),
                  CustomButton(
                    text: 'Button',
                    width: 135.w,
                    onPressed: () {
                      context.pushNamedAndRemoveUntil(
                        Routes.login,
                        predicate: (route) => false,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
