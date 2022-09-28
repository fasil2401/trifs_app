import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomText {
  static buildTitleText({required String title}) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 10),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16.sp,
          color: Color.fromARGB(255, 138, 138, 138),
          fontWeight: FontWeight.bold,
          fontFamily: 'Lato',
        ),
      ),
    );
  }

  static buildPackageTitle({required String title}) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 5,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16.sp,
          color: Color.fromARGB(255, 138, 138, 138),
          fontWeight: FontWeight.bold,
          fontFamily: 'Lato',
        ),
      ),
    );
  }
}
