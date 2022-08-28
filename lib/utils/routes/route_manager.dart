import 'package:get/get.dart';
import 'package:trifs_app/view/login/login_screen.dart';
import 'package:trifs_app/view/register/register_screen.dart';
import 'package:trifs_app/view/splash%20screen/splash_screen.dart';

class AppRoutes {

static const String splashScreen = '/splash';
static const String loginScreen = '/login';
static const String registerScreen = '/register';

  List<GetPage> routes = [
    GetPage(
        name: '/splash',
        page: () => SplashScreen(),
        transition: Transition.cupertino),
    GetPage(
        name: '/login',
        page: () =>  LoginScreen(),
        transition: Transition.cupertino),
    GetPage(
        name: '/register',
        page: () =>  RegisterScreen(),
        transition: Transition.cupertino)
  ];
}
