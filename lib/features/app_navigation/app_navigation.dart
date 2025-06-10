import 'package:coffee_shop/features/orders/ui/screens/orders_screen.dart';
import 'package:flutter/material.dart';
import 'package:coffee_shop/core/theme/app_color.dart';
import 'package:coffee_shop/features/home/ui/screens/home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:badges/badges.dart' as badges;

class AppNavigation extends StatefulWidget {
  const AppNavigation({super.key});

  @override
  State<AppNavigation> createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    OrdersScreen(),
    HomeScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
            badgeContent: Text('0', style: TextStyle(color: Colors.white)),
            child: Icon(Icons.shopping_bag_outlined, size: 31.w),
          ),

          SizedBox(width: 20.w),
        ],
      ),

      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: AppColor.button,
        unselectedItemColor: AppColor.grey,
        showUnselectedLabels: true,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/home.svg',
              colorFilter: ColorFilter.mode(AppColor.grey, BlendMode.srcIn),
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/home.svg',
              colorFilter: ColorFilter.mode(AppColor.button, BlendMode.srcIn),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/order.svg',
              colorFilter: ColorFilter.mode(AppColor.grey, BlendMode.srcIn),
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/order.svg',
              colorFilter: ColorFilter.mode(AppColor.button, BlendMode.srcIn),
            ),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/account.svg',
              colorFilter: ColorFilter.mode(AppColor.grey, BlendMode.srcIn),
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/account.svg',
              colorFilter: ColorFilter.mode(AppColor.button, BlendMode.srcIn),
            ),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
