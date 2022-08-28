import 'package:get/get.dart';
import 'package:trifs_app/view/login/login_screen.dart';
import 'package:trifs_app/view/splash%20screen/splash_screen.dart';

class AppRoutes {
  List<GetPage> routes = [
    GetPage(
        name: '/splash',
        page: () =>  SplashScreen(),
        transition: Transition.cupertino),
    GetPage(
        name: '/login',
        page: () => const LoginScreen(),
        transition: Transition.cupertino)
  ];
}
