import 'dart:developer' as developer;
import 'package:get/get.dart';
import 'package:trifs_app/Services/api_services.dart';
import 'package:trifs_app/model/Explore%20Model/list_places_model.dart';
import 'package:trifs_app/utils/User%20Preferences/user_preference.dart';
import 'package:trifs_app/utils/constants/api_constants.dart';

class ExploreController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getPlaces();
  }

  var isLoading = false.obs;
  var status = ''.obs;
  var message = ''.obs;
  var places = [].obs;

  generateParams() {
    final String district = UserSimplePreferences.getDistrict() ?? '';
    final String state = UserSimplePreferences.getState() ?? '';
    return {
      'state': state,
      'district': district,
    };
  }

  getPlaces() async {
    var result;
    try {
      isLoading.value = true;
      var feedback =
          await ApiManager.fetchData(api: Api.places, params: generateParams());
      if (feedback != null) {
        result = ListPlacesModel.fromJson(feedback);
        status.value = result.sts;
        message.value = result.msg;
        developer.log(result.places.toString(), name: 'API DATA');
      } else {}
    } finally {
      if (status.value == '01') {
        isLoading.value = false;
        places.value = result.places;
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
