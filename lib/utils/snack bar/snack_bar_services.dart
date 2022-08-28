import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarServices {
  static void showSuccessSnackBar(String message) {
    Get.snackbar('Success', message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        borderRadius: 15,
        margin: EdgeInsets.all(10),
        snackStyle: SnackStyle.FLOATING,
        duration: Duration(seconds: 2));
  }
}
