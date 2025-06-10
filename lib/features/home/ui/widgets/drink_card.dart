import 'package:coffee_shop/core/widgets/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrinkCard extends StatelessWidget {
  const DrinkCard({super.key, required this.title, required this.image});
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 180.h,
      padding: const EdgeInsets.all(12),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        shadows: [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 20,
            offset: Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 20.w,
                height: 20.h,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: SvgPicture.asset('assets/icons/love.svg'),
                ),
              ),
              GapW(width: 10),
            ],
          ),
          Image.asset(image, width: 100.w, height: 100.h),
          GapH(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF212121),
              fontSize: 16.sp,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              height: 1.43,
            ),
          ),
        ],
      ),
    );
  }
}
