import 'package:flutter/material.dart';

class ThemeProvider {
  final ThemeData _themeData = ThemeData(
    fontFamily: 'Lato',
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
  get theme => _themeData;
}
