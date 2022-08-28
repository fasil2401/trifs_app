import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trifs_app/utils/routes/route_manager.dart';
import 'utils/themes/theme_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Trifs App',
      theme:ThemeProvider().theme,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes().routes[0].name,
      getPages: AppRoutes().routes,
    );
  }
}
