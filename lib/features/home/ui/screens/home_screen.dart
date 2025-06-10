import 'package:coffee_shop/core/drinks/drinks.dart';
import 'package:coffee_shop/core/widgets/gap.dart';
import 'package:coffee_shop/features/home/ui/screens/order_details_screen.dart';
import 'package:coffee_shop/features/home/ui/widgets/discount_card.dart';
import 'package:coffee_shop/features/home/ui/widgets/drink_card.dart';
import 'package:coffee_shop/features/home/ui/widgets/welcome_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late bool favo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F2ED),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              GapH(height: 40),
              WelcomeUser(),
              DiscountCard(),
              GapH(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Drinks',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF272727),
                      fontSize: 20.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'See all',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF4E8D7C),
                        fontSize: 14.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 30.h,
                  crossAxisSpacing: 16.w,
                ),
                physics: NeverScrollableScrollPhysics(),
                itemCount: Drinks.homeDrinks.length,

                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return OrderDetailsScreen(
                              title:
                                  Drinks.homeDrinks[index]['title'] as String,
                              image:
                                  Drinks.homeDrinks[index]['image'] as String,
                            );
                          },
                        ),
                      );
                    },
                    child: DrinkCard(
                      isFavorite:
                          Drinks.homeDrinks[index]['isFavorite'] as bool,
                      fav: () {},
                      title: Drinks.homeDrinks[index]['title'] as String,
                      image: Hero(
                        transitionOnUserGestures: true,
                        tag: Drinks.homeDrinks[index]['title'] as String,
                        child: Image.asset(
                          Drinks.homeDrinks[index]['image'] as String,
                          width: 100.w,
                          height: 100.h,
                        ),
                      ),
                    ),
                  );
                },
              ),
              GapH(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
