import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:trifs_app/utils/User%20Preferences/user_preference.dart';
import 'package:trifs_app/utils/routes/route_manager.dart';
import 'utils/themes/theme_provider.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await UserSimplePreferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
   return Sizer(builder: (context, orientation, deviceType){
    return GetMaterialApp(
      title: 'Trifs App',
      theme:ThemeProvider().theme,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes().routes[0].name,
      getPages: AppRoutes().routes,
    );
   });
  }
}
