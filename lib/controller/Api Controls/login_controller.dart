import 'package:get/get.dart';
import 'package:trifs_app/Services/api_services.dart';
import 'package:trifs_app/model/login_model.dart';
import 'package:trifs_app/utils/constants/api_constants.dart';
import 'package:trifs_app/utils/routes/route_manager.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var status = ''.obs;
  var message = ''.obs;
  var user = User().obs;
  var password = ''.obs;
  var mobileNumber = ''.obs;

  generateParams() {
    return {
      'emailormobile': mobileNumber.value,
      'password': password.value,
    };
  }

  getMobileNumber(String mobileNumber) {
    this.mobileNumber.value = mobileNumber;
  }

  getPassword(String password) {
    this.password.value = password;
  }

  getLogin() async {
    var result;
    try {
      isLoading.value = true;
      var feedback =
          await ApiManager.fetchData(api: Api.login, params: generateParams());
      if (feedback != null) {
        result = LoginModel.fromJson(feedback);
        print(result.user.name);
        status.value = result.sts;
        message.value = result.msg;
      } else {}
    } finally {
      if (status.value == '01') {
        user.value = result.user;
        isLoading.value = false;
        Get.offAllNamed(AppRoutes.mainScreen);
      } else {
        isLoading.value = false;
        Get.snackbar(
          'Error',
          message.value,
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 1),
        );
      }
    }
  }
}
