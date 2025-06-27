import 'package:coffee_shop/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.icon,
    this.obscure,
    this.controller,
  });
  final String hint;
  final IconButton? icon;
  final bool? obscure;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please Enter $hint';
        }
        return null;
      },
      controller: controller,
      obscureText: obscure ?? false,
      decoration: InputDecoration(
        fillColor: Colors.white,
        suffixIcon: icon,
        hintText: hint,
        hintStyle: TextStyle(
          color: AppColor.grey,
          fontSize: 16.sp,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22.r),
          borderSide: BorderSide(color: AppColor.grey.withOpacity(0.4)),
        ),

        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22.r),
          borderSide: BorderSide(color: AppColor.grey.withOpacity(0.4)),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22.r),
          borderSide: BorderSide(color: AppColor.button),
        ),
      ),
    );
  }
}
