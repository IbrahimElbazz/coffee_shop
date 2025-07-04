import 'package:coffee_shop/core/routing/extensions.dart';
import 'package:coffee_shop/core/routing/routes.dart';
import 'package:coffee_shop/core/theme/app_color.dart';
import 'package:coffee_shop/core/widgets/custom_button.dart';
import 'package:coffee_shop/core/widgets/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

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
                width: 304.w,
                height: 240.h,
                child: Image.asset('assets/image/onboarding_1.png'),
              ),
              GapH(height: 100),
              Text(
                textAlign: TextAlign.center,
                'Choose and customize your drinks with simplicity',
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
                  'You want your drink and you want it your way so be bold and customize\n the way that makes you the\n happiest!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              GapH(height: 132),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset('assets/icons/loading_1.svg'),
                  CustomButton(
                    text: 'Button',
                    width: 135.w,
                    onPressed: () {
                      context.pushNamed(Routes.onboarding_2);
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
