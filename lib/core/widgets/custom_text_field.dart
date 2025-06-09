import 'package:coffee_shop/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.icon,
    this.obsecure,
  });
  final String hint;
  final IconButton? icon;
  final bool? obsecure;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obsecure ?? false,
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
          borderSide: BorderSide(color: AppColor.grey),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22.r),
          borderSide: BorderSide(color: AppColor.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22.r),
          borderSide: BorderSide(color: AppColor.grey),
        ),
      ),
    );
  }
}
