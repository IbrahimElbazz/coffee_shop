import 'package:coffee_shop/core/routing/extensions.dart';
import 'package:coffee_shop/core/routing/routes.dart';
import 'package:coffee_shop/core/theme/app_color.dart';
import 'package:coffee_shop/core/widgets/custom_button.dart';
import 'package:coffee_shop/core/widgets/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Onboarding2 extends StatelessWidget {
  const Onboarding2({super.key});

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
                width: 226.w,
                height: 243.h,
                child: Image.asset('assets/image/onboarding_2.png'),
              ),
              GapH(height: 100),
              Text(
                textAlign: TextAlign.center,
                'No time to waste when you need your coffee',
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
                  'We’ve crafted a quick and easy\n way for you to order your favorite\n coffee or treats thats fast!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              GapH(height: 153),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset('assets/icons/loading_2.svg'),
                  CustomButton(
                    text: 'Button',
                    width: 135.w,
                    onPressed: () {
                      context.pushNamed(Routes.onboarding_3);
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
