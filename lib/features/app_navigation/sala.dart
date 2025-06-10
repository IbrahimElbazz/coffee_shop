import 'package:flutter/material.dart';

class OrderState extends ChangeNotifier {
  int _orderNumber = 0;

  int get orderNumber => _orderNumber;

  void updateOrderNumber() {
    _orderNumber++;
    notifyListeners();
  }
}
