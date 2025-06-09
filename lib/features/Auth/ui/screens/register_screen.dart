import 'package:coffee_shop/core/routing/extensions.dart';
import 'package:coffee_shop/core/theme/app_color.dart';
import 'package:coffee_shop/core/widgets/custom_button.dart';
import 'package:coffee_shop/core/widgets/custom_text_field.dart';
import 'package:coffee_shop/core/widgets/gap.dart';
import 'package:coffee_shop/features/Auth/ui/widget/pass_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                      'Sign Up',
                      style: TextStyle(
                        color: AppColor.button,
                        fontSize: 28.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    GapH(height: 16),
                    Text(
                      'We are so excited you’re ready to \nbecome apart of our coffee network! \ndon’t forget  check out your perks!',
                      style: TextStyle(
                        color: AppColor.button,
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
                      'Email or phone number',
                      style: TextStyle(
                        color: AppColor.green,
                        fontSize: 14.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    GapH(height: 8),
                    CustomTextField(hint: 'Type your email or phone number'),
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
                    CustomButton(
                      width: 320,
                      text: 'REGISTER',
                      onPressed: () {},
                    ),
                    GapH(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black.withValues(alpha: 128),
                            fontSize: 14.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    GapH(height: 20),

                    CustomButton(
                      width: 320,
                      text: 'SIGN IN',
                      onPressed: () {
                        context.pop();
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
