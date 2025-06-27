import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class CustomSnackBar {
  static void show({
    required BuildContext context,
    required String message,
    required ToastificationType type,
    ToastificationStyle style = ToastificationStyle.flat,
    Duration autoCloseDuration = const Duration(seconds: 5),
  }) {
    Toastification().show(
      type: type,
      style: style,
      context: context,
      title: Text(message),
      autoCloseDuration: autoCloseDuration,
    );
  }
}
