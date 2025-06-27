import 'package:coffee_shop/core/routing/extensions.dart';
import 'package:coffee_shop/core/theme/app_color.dart';
import 'package:coffee_shop/core/widgets/custom_button.dart';
import 'package:coffee_shop/core/widgets/custom_text_field.dart';
import 'package:coffee_shop/core/widgets/gap.dart';
import 'package:coffee_shop/features/Auth/register/logic/cubit/register_cubit.dart';
import 'package:coffee_shop/features/Auth/register/logic/cubit/register_state.dart';
import 'package:coffee_shop/core/widgets/pass_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listenWhen: (previous, current) {
        return current is RegisterError ||
            current is RegisterLoading ||
            current is RegisterSuccess;
      },
      listener: (context, state) {
        if (state is RegisterError) {
          context.pop();
          Toastification().show(
            type: ToastificationType.error,
            style: ToastificationStyle.flat,
            context: context,
            title: Text(state.message),
            autoCloseDuration: const Duration(seconds: 5),
          );
        }
        if (state is RegisterSuccess) {
          context.pop();
          context.pop();
          Toastification().show(
            type: ToastificationType.success,
            context: context,
            style: ToastificationStyle.flat,
            title: Text('Successfully registered'),
            autoCloseDuration: const Duration(seconds: 5),
          );
        }
        if (state is RegisterLoading) {
          showDialog(
            context: context,
            builder: (context) {
              return Center(
                child: CircularProgressIndicator(color: AppColor.button),
              );
            },
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColor.backGroundOnboarding,
        body: SingleChildScrollView(
          child: Form(
            key: context.read<RegisterCubit>().formKey,
            child: Column(
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
                    padding: EdgeInsets.symmetric(
                      horizontal: 70.w,
                      vertical: 30.h,
                    ),
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
                          CustomTextField(
                            hint: 'Enter username',
                            controller: context.read<RegisterCubit>().userName,
                          ),
                          GapH(height: 20),
                          Text(
                            'Phone Number',
                            style: TextStyle(
                              color: AppColor.green,
                              fontSize: 14.sp,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          GapH(height: 8),
                          CustomTextField(
                            hint: 'Enter phone number',
                            controller: context.read<RegisterCubit>().phone,
                          ),
                          GapH(height: 20),
                          Text(
                            'Email',
                            style: TextStyle(
                              color: AppColor.green,
                              fontSize: 14.sp,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          GapH(height: 8),
                          CustomTextField(
                            hint: 'Type your email',
                            controller: context.read<RegisterCubit>().email,
                          ),
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
                          PassContainer(
                            controller: context.read<RegisterCubit>().password,
                          ),
                          GapH(height: 30),
                          CustomButton(
                            width: 320,
                            text: 'REGISTER',
                            onPressed: () {
                              if (context
                                  .read<RegisterCubit>()
                                  .formKey
                                  .currentState!
                                  .validate()) {
                                context.read<RegisterCubit>().register();
                              }
                            },
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
          ),
        ),
      ),
    );
  }
}
