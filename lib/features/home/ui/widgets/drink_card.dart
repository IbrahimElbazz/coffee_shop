import 'package:coffee_shop/core/widgets/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrinkCard extends StatefulWidget {
  DrinkCard({
    super.key,
    required this.title,
    required this.image,
    this.fav,
    this.isFavorite = false,
  });
  final String title;
  final Widget image;
  void Function()? fav;

  bool isFavorite;

  @override
  State<DrinkCard> createState() => _DrinkCardState();
}

class _DrinkCardState extends State<DrinkCard> {
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
                  onPressed: widget.fav,
                  icon: SvgPicture.asset(
                    'assets/icons/love.svg',
                    color: widget.isFavorite ? Colors.red : Colors.grey,
                  ),
                ),
              ),
              GapW(width: 10),
            ],
          ),
          widget.image,
          GapH(height: 10),
          Text(
            widget.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF212121),
              fontSize: 16.sp,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
