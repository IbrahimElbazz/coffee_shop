import 'package:coffee_shop/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/app_navigation/sala.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => OrderState(),
      child: const CoffeeShop(),
    ),
  );
}
