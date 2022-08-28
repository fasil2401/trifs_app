import 'package:get/get.dart';

class RegisterController extends GetxController {
  var isLoading = false.obs;
  var status = ''.obs;
  var message = ''.obs;
  var password = ''.obs;
  var confirmPassword = ''.obs;
  var mobileNumber = ''.obs;
  var email = ''.obs;
  var name = ''.obs;
  var mobileWarning = false.obs;
  var emailWarning = false.obs;

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

  getConfirmPassword(String confirmPassword) {
    this.confirmPassword.value = confirmPassword;
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
}
