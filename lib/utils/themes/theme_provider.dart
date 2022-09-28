import 'package:flutter/material.dart';
import 'package:trifs_app/utils/constants/colors.dart';

class ThemeProvider {
  final ThemeData _themeData = ThemeData(
    fontFamily: 'Lato',
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: AppColors.scaffoldBackground,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
  get theme => _themeData;
}
