import 'package:coffee_shop/core/routing/extensions.dart';
import 'package:coffee_shop/core/routing/routes.dart';
import 'package:coffee_shop/core/theme/app_color.dart';
import 'package:coffee_shop/core/widgets/custom_button.dart';
import 'package:coffee_shop/core/widgets/custom_text_field.dart';
import 'package:coffee_shop/core/widgets/gap.dart';
import 'package:coffee_shop/features/Auth/ui/widget/pass_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGroundOnboarding,
      resizeToAvoidBottomInset: false,

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GapH(height: 60),
          SvgPicture.asset('assets/icons/logo.svg'),
          GapH(height: 15),
          Container(
            width: 430.w,
            height: 760.h,
            decoration: ShapeDecoration(
              color: const Color(0xFFFAFAFA),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(34.r),
                  topRight: Radius.circular(34.r),
                ),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 5.r,
                  offset: Offset(0, -2),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 70.w, vertical: 30.h),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sign in',
                      style: TextStyle(
                        color: AppColor.buttom,
                        fontSize: 28.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    GapH(height: 16),
                    Text(
                      'It’s coffee time! Login and lets get all the coffee in the world! Or at least iced\ncoffee. ',
                      style: TextStyle(
                        color: AppColor.buttom,
                        fontSize: 14.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    GapH(height: 30),
                    Text(
                      'Username',
                      style: TextStyle(
                        color: AppColor.green,
                        fontSize: 14.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    GapH(height: 8),
                    CustomTextField(hint: 'Enter username'),
                    GapH(height: 20),
                    Text(
                      'Password',
                      style: TextStyle(
                        color: AppColor.green,
                        fontSize: 14.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    GapH(height: 8),
                    PassContainer(),
                    GapH(height: 30),
                    CustomButton(width: 320, text: 'LOGIN', onPressed: () {}),
                    GapH(height: 84),
                    Row(
                      spacing: 10.w,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Forgot password?',
                          style: TextStyle(
                            color: const Color(0xFF4E8D7C),
                            fontSize: 16.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          'Reset here',
                          style: TextStyle(
                            color: const Color(0xFF4B2C20),
                            fontSize: 16.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    GapH(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don’t have an account?',
                          style: TextStyle(
                            color: Colors.black.withValues(alpha: 128),
                            fontSize: 14.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    GapH(height: 22),
                    CustomButton(
                      width: 320,
                      text: 'CREATE NEW ACCOUNT',
                      onPressed: () {
                        context.pushNamed(Routes.register);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
