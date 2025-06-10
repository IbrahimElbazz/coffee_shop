import 'package:coffee_shop/core/widgets/custom_button.dart';
import 'package:coffee_shop/core/widgets/gap.dart';
import 'package:coffee_shop/features/orders/ui/screens/orders_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F2ED),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GapH(height: 50.h),
            Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/image/face.png',
                    width: 100.w,
                    height: 100.h,
                  ),
                  GapH(height: 16.h),
                  Text(
                    'Ibrahim Elbaz',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GapH(height: 8.h),
                  Text(
                    'Regular Customer',
                    style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                  ),
                ],
              ),
            ),

            GapH(height: 32.h),

            // Profile Information
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
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
              child: Padding(
                padding: EdgeInsets.all(22.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Profile Information',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    _buildProfileItem('Email', 'ibrahim@example.com'),
                    _buildProfileItem('Phone', '+123 456 7890'),
                    _buildProfileItem('Member Since', 'June 2023'),
                  ],
                ),
              ),
            ),

            GapH(height: 150.h),

            CustomButton(
              width: double.infinity,
              text: 'Logout',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileItem(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(
            value,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
          ),
        ],
      ),
    );
  }
}
