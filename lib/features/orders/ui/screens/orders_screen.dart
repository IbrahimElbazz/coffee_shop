import 'package:coffee_shop/features/orders/ui/widgets/no_item_card.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F2ED),
      body: Column(children: [NoItemCard()]),
    );
  }
}
