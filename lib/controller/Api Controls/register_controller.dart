import 'package:get/get.dart';
import 'package:trifs_app/Services/api_services.dart';
import 'package:trifs_app/model/common_response_model.dart';
import 'package:trifs_app/utils/constants/api_constants.dart';
import 'package:trifs_app/utils/routes/route_manager.dart';
import 'package:trifs_app/utils/snack%20bar/snack_bar_services.dart';

class RegisterController extends GetxController {
  var isLoading = false.obs;
  var status = ''.obs;
  var message = ''.obs;
  var password = ''.obs;
  var pincode = ''.obs;
  var mobileNumber = ''.obs;
  var email = ''.obs;
  var name = ''.obs;
  var mobileWarning = false.obs;
  var emailWarning = false.obs;

  generateParams() {
    return {
      'name': name.value,
      'email': email.value,
      'password': password.value,
      'mobile': mobileNumber.value,
      'pincode': pincode.value,
    };
  }

  getMobileNumber(String mobileNumber) {
    mobileWarning.value = true;
    this.mobileNumber.value = mobileNumber;
    if (this.mobileNumber.value.length == 10) {
      mobileWarning.value = false;
    } else {
      mobileWarning.value = true;
    }
  }

  getPassword(String password) {
    this.password.value = password;
  }

  getPincode(String pincode) {
    this.pincode.value = pincode;
  }

  getEmail(String email) {
    this.email.value = email;
    GetUtils.isEmail(this.email.value)
        ? emailWarning.value = false
        : emailWarning.value = true;
  }

  getName(String name) {
    this.name.value = name;
  }

  getRegister() async {
    try {
      isLoading.value = true;
      var feedback = await ApiManager.fetchData(
          api: Api.register, params: generateParams());
      if (feedback != null) {
        var result = CommonResponseModel.fromJson(feedback);
        print(result);
        status.value = result.sts;
        message.value = result.msg;
      } else {}
    } finally {
      if (status.value == '01') {
        isLoading.value = false;
        SnackBarServices.showSuccessSnackBar(
          'Please Login',
        );
        Get.offAllNamed(AppRoutes.loginScreen);
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
