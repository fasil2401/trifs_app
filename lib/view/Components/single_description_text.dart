import 'package:flutter/material.dart';
import 'package:trifs_app/utils/constants/colors.dart';

class DescriptioText {
  static buildContentText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 13,
        color: AppColors.black,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  static buildHeadText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 13,
        color: AppColors.grey,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  static buildHighLightText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        color: AppColors.black,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
