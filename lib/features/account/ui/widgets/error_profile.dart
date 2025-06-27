import 'package:coffee_shop/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorWidgetProfile extends StatelessWidget {
  const ErrorWidgetProfile({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(20.r),
        decoration: BoxDecoration(
          color: AppColor.button,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(width: 1, color: AppColor.white),
        ),
        child: Text(
          message,
          style: TextStyle(fontSize: 16.sp, color: AppColor.white),
        ),
      ),
    );
  }
}
