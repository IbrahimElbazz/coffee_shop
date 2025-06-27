import 'package:coffee_shop/core/routing/extensions.dart';
import 'package:coffee_shop/core/routing/routes.dart';
import 'package:coffee_shop/core/theme/app_color.dart';
import 'package:coffee_shop/core/widgets/custom_button.dart';
import 'package:coffee_shop/core/widgets/gap.dart';
import 'package:coffee_shop/features/account/logic/cubit/account_cubit.dart';
import 'package:coffee_shop/features/account/logic/cubit/account_state.dart';
import 'package:coffee_shop/features/account/ui/widgets/error_profile.dart';
import 'package:coffee_shop/features/account/ui/widgets/loading_profile.dart';
import 'package:coffee_shop/features/account/ui/widgets/profile_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  void initState() {
    context.read<AccountCubit>().getInfo();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F2ED),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.r),
        child: BlocBuilder<AccountCubit, AccountState>(
          buildWhen: (previous, current) {
            return current is AccountLoading ||
                current is AccountSuccess ||
                current is AccountError;
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GapH(height: 50.h),
                _buildProfileHeader(state),
                GapH(height: 32.h),
                _buildProfileInfoSection(state),
                GapH(height: 150.h),
                CustomButton(
                  width: double.infinity,
                  text: 'Logout',
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    FirebaseAuth.instance.currentUser != null
                        ? null
                        : context.pushNamedAndRemoveUntil(
                          Routes.login,
                          predicate: (route) => false,
                        );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildProfileHeader(AccountState state) {
    final cub = context.read<AccountCubit>();
    return Center(
      child: Column(
        children: [
          Image.asset('assets/image/face.png', width: 100.w, height: 100.h),
          GapH(height: 16.h),
          if (state is AccountSuccess)
            Text(
              cub.name,
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
            )
          else if (state is AccountLoading)
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: 150.w,
                height: 24.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
          GapH(height: 8.h),
        ],
      ),
    );
  }

  Widget _buildProfileInfoSection(AccountState state) {
    final cub = context.read<AccountCubit>();
    return Container(
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
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.h),
            if (state is AccountSuccess)
              Column(
                children: [
                  buildProfileItem('Email', cub.email),
                  buildProfileItem('Phone', cub.phone),
                  buildProfileItem('Member Since', cub.date),
                ],
              )
            else if (state is AccountError)
              ErrorWidgetProfile(message: state.message)
            else // Loading or other states
              const LoadingWidgetProfile(),
          ],
        ),
      ),
    );
  }
}
