import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class Toast {
  static void showAlertBar(BuildContext context, String title, String message) {
    Flushbar(
      title: title,
      message: message,
      icon: const Icon(
        Icons.error,
        size: 28.0,
        color: Colors.red,
      ),
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(8),
    ).show(context);
  }

  void showLoading(BuildContext context) {
    Flushbar(
      message: 'Loading...',
      showProgressIndicator: true,
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.GROUNDED,
    ).show(context);
  }
}
