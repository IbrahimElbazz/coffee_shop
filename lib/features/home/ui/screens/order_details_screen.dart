import 'package:coffee_shop/core/widgets/custom_button.dart';
import 'package:coffee_shop/core/widgets/gap.dart';
import 'package:coffee_shop/features/app_navigation/sala.dart';
import 'package:coffee_shop/features/home/ui/widgets/counter.dart';
import 'package:coffee_shop/features/home/ui/widgets/image_and_name_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:badges/badges.dart' as badges;
import 'package:coffee_shop/core/theme/app_color.dart';
import 'package:provider/provider.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({
    super.key,
    required this.title,
    required this.image,
  });
  final String title;
  final String image;

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        shadowColor: Colors.black.withOpacity(0.3),
        elevation: 3,
        title: SvgPicture.asset(
          'assets/icons/logo.svg',
          width: 35.w,
          height: 50.h,
        ),

        centerTitle: true,
        backgroundColor: const Color(0xFFFEFEF8),
        actions: [
          badges.Badge(
            badgeStyle: badges.BadgeStyle(badgeColor: AppColor.green),
            badgeContent: Consumer<OrderState>(
              builder: (context, orderState, child) {
                return Text(
                  orderState.orderNumber.toString(),
                  style: TextStyle(color: Colors.white),
                );
              },
            ),
            child: Icon(Icons.shopping_bag_outlined, size: 31.w),
          ),

          SizedBox(width: 20.w),
        ],
      ),
      backgroundColor: const Color(0xFFF6F2ED),
      body: Column(
        children: [
          GapH(height: 40),
          ImageAndNameCard(title: widget.title, image: widget.image),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '\$${6.99}',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                GapH(height: 20),
                Text(
                  'XLarge, 3 Splenda\n6 Pump (s) Pumpkin spice\n3 Shot (s) Espresso\nPumpkin Spice Toppings\nOatmilk\nNormal Ice ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                GapH(height: 25),
                Text(
                  'Special Instructions',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.sp,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                GapH(height: 10),
                Text(
                  'Gluten Free, please make sure as I have Celiac Disease',
                  style: TextStyle(
                    color: const Color(0xFF272727),
                    fontSize: 14.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                GapH(height: 50),
                Counter(),
                GapH(height: 150),
                CustomButton(
                  width: 600.w,
                  text: 'Place Order',
                  onPressed: () {
                    // In your order details screen
                    final orderState = Provider.of<OrderState>(
                      context,
                      listen: false,
                    );
                    orderState
                        .updateOrderNumber(); // This will increase the order number by 1
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
