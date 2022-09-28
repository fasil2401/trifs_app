import 'package:flutter/material.dart';
import 'package:trifs_app/utils/constants/colors.dart';

class ThemeProvider {
  final ThemeData _themeData = ThemeData(
    fontFamily: 'Lato',
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: AppColors.scaffoldBackground,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      elevation: 2,
      toolbarTextStyle: TextStyle(
        fontFamily: 'Lato',
        color: AppColors.black,
        fontWeight: FontWeight.bold,
      ),
      titleTextStyle: TextStyle(
        fontFamily: 'Lato',
        color: AppColors.primaryColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: AppColors.primaryColor,
      ),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
  get theme => _themeData;
}
