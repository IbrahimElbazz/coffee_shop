import 'package:coffee_shop/core/widgets/gap.dart';
import 'package:coffee_shop/features/home/logic/cubit/order_details_cubit.dart';
import 'package:coffee_shop/features/home/ui/screens/order_details_screen.dart';
import 'package:coffee_shop/features/home/ui/widgets/discount_card.dart';
import 'package:coffee_shop/features/home/ui/widgets/drink_card.dart';
import 'package:coffee_shop/features/home/ui/widgets/welcome_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shimmer/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CollectionReference drinks = FirebaseFirestore.instance.collection(
    'homeDrinks',
  );
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
              FutureBuilder<QuerySnapshot>(
                future: drinks.get(),
                builder: (
                  BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot,
                ) {
                  if (snapshot.hasError) {
                    return Center(child: const Text("Something went wrong"));
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 30.h,
                          crossAxisSpacing: 16.w,
                          childAspectRatio: 0.75, // Adjust as needed
                        ),
                        itemCount: snapshot.data?.docs.length ?? 2,
                        itemBuilder: (context, index) {
                          return Hero(
                            tag: '${snapshot.data?.docs[index]['name']}',
                            transitionOnUserGestures: true,
                            child: DrinkCard(
                              price: snapshot.data?.docs[index]['price'],
                              title: snapshot.data?.docs[index]['name'],
                              image: CachedNetworkImage(
                                width: 100.w,
                                height: 100.h,
                                fit: BoxFit.cover,
                                imageUrl: 'imageUrl',
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Center(child: const Text("No drinks available"));
                  }

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 30.h,
                      crossAxisSpacing: 16.w,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: snapshot.data?.docs.length ?? 0,
                    itemBuilder: (context, index) {
                      final doc = snapshot.data!.docs[index];
                      final data = doc.data() as Map<String, dynamic>;

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => BlocProvider(
                                    create: (context) => OrderDetailsCubit(),
                                    child: OrderDetailsScreen(
                                      price: data['price'] ?? 0,
                                      title: data['name'],
                                      image: data['imageUrl'],
                                    ),
                                  ),
                            ),
                          );
                        },
                        child: DrinkCard(
                          price: data['price'],
                          title: data['name'],
                          image: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Hero(
                              transitionOnUserGestures: true,
                              tag: data['name'],
                              child: CachedNetworkImage(
                                imageUrl: data['imageUrl'],
                                width: 120.w,
                                height: 120.h,
                                fit: BoxFit.cover,
                                placeholder:
                                    (context, url) =>
                                        const CircularProgressIndicator(),
                                errorWidget:
                                    (context, url, error) =>
                                        const Icon(Icons.error),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
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
