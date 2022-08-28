import 'package:get/get.dart';
import 'package:trifs_app/model/login_model.dart';

class LoginController extends GetxController {
 
 var isLoading = false.obs;
 var status = ''.obs;
  var message = ''.obs; 
  var user = User().obs;
  var password = ''.obs;
  var mobileNumber = ''.obs;

  getMobileNumber(String mobileNumber) {
    this.mobileNumber.value = mobileNumber;
  }
  getPassword(String password) {
    this.password.value = password;
  }

  
}