import 'package:coffee_shop/coffee_shop.dart';
import 'package:coffee_shop/core/helper/bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'features/app_navigation/sala.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = MyBlocObserver();
  runApp(
    ChangeNotifierProvider(
      create: (context) => OrderState(),
      child: const CoffeeShop(),
    ),
  );
}
