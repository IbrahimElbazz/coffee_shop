import 'package:coffee_shop/core/widgets/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoItemCard extends StatelessWidget {
  const NoItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GapH(height: 150),
        Center(
          child: Container(
            width: 336.w,
            padding: const EdgeInsets.all(40),
            decoration: ShapeDecoration(
              color: const Color(0xFFF9F9F9),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0x02000000),
                  blurRadius: 1.59,
                  offset: Offset(0, 1),
                  spreadRadius: 0,
                ),
                BoxShadow(
                  color: Color(0x02000000),
                  blurRadius: 3.62,
                  offset: Offset(0, 2),
                  spreadRadius: 0,
                ),
                BoxShadow(
                  color: Color(0x04000000),
                  blurRadius: 10.02,
                  offset: Offset(0, 6),
                  spreadRadius: 0,
                ),
                BoxShadow(
                  color: Color(0x04000000),
                  blurRadius: 15.46,
                  offset: Offset(0, 10),
                  spreadRadius: 0,
                ),
                BoxShadow(
                  color: Color(0x05000000),
                  blurRadius: 24.12,
                  offset: Offset(0, 15),
                  spreadRadius: 0,
                ),
                BoxShadow(
                  color: Color(0x06000000),
                  blurRadius: 40.04,
                  offset: Offset(0, 25),
                  spreadRadius: 0,
                ),
                BoxShadow(
                  color: Color(0x07000000),
                  blurRadius: 80,
                  offset: Offset(0, 50),
                  spreadRadius: 0,
                ),
                BoxShadow(
                  color: Color(0x05000000),
                  blurRadius: 50,
                  offset: Offset(0, -20),
                  spreadRadius: -30,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 13,
              children: [
                SizedBox(
                  width: 48.w,
                  height: 48.h,
                  child: Image.asset('assets/image/shopping-bag.png'),
                ),
                Text(
                  'No item in your cart',
                  style: TextStyle(
                    color: const Color(0xFF4A4646),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
