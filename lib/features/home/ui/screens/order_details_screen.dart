import 'package:coffee_shop/core/widgets/custom_button.dart';
import 'package:coffee_shop/core/widgets/custom_snack_bar.dart';
import 'package:coffee_shop/core/widgets/gap.dart';
import 'package:coffee_shop/features/home/logic/cubit/order_details_cubit.dart';
import 'package:coffee_shop/features/home/logic/cubit/order_details_state.dart';
import 'package:coffee_shop/features/home/ui/widgets/counter.dart';
import 'package:coffee_shop/features/home/ui/widgets/image_and_name_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:toastification/toastification.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({
    super.key,
    required this.title,
    required this.image,
    required this.price,
  });
  final String title;
  final String image;
  final int price;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
      builder: (context, state) {
        return BlocListener<OrderDetailsCubit, OrderDetailsState>(
          listenWhen: (previous, current) {
            return current is AddOrderSuccess ||
                current is AddOrderFailure ||
                current is OrderDetailsLoading;
          },

          listener: (context, state) {
            if (state is AddOrderSuccess) {
              CustomSnackBar.show(
                context: context,
                message: 'Order added successfully',
                type: ToastificationType.success,
              );
              context.read<OrderDetailsCubit>().amount = 1;
            } else if (state is AddOrderFailure) {
              CustomSnackBar.show(
                context: context,
                message: state.error,
                type: ToastificationType.error,
              );
            }
          },

          child: Scaffold(
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
            ),
            backgroundColor: const Color(0xFFF6F2ED),
            body: Column(
              children: [
                GapH(height: 40),
                ImageAndNameCard(title: title, image: image),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 20.h,
                    horizontal: 16.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.sp,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '$price \$',
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
                      Counter(
                        price: price,
                        amount: context.read<OrderDetailsCubit>().amount,
                      ),
                      GapH(height: 150),
                      CustomButton(
                        width: 600.w,
                        text: 'Place Order',
                        onPressed: () {
                          final cubit = context.read<OrderDetailsCubit>();
                          cubit.addOrder(price: price);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
