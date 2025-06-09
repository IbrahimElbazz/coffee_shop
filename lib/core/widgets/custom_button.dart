import 'package:coffee_shop/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.width,
    required this.text,
    this.onPressed,
  });
  final double width;
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.buttom,
        foregroundColor: AppColor.buttom,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22.r),
        ),
      ),
      onPressed: onPressed,
      child: Container(
        width: width.w,
        height: 60.h,
        color: AppColor.buttom,
        child: Center(
          child: Text(
            text,

            style: TextStyle(
              color: const Color(0xFFF6F2ED),
              fontSize: 14.sp,

              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
