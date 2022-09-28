import 'package:get/get.dart';
import 'package:trifs_app/utils/routes/route_manager.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checkIn();
  }

  checkIn() {
    Future.delayed(Duration(seconds: 3), () {
      Get.offAllNamed(AppRoutes.loginScreen);
    });
  }
}
