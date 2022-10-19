import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:trifs_app/Services/api_services.dart';
import 'package:trifs_app/model/search_pincode_model.dart';
import 'package:trifs_app/utils/User%20Preferences/user_preference.dart';
import 'package:trifs_app/utils/constants/api_constants.dart';

class LocationController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getCurrentLocation();
  }

  var isLoading = false.obs;
  var status = ''.obs;
  var message = ''.obs;
  var location = 'Select Location'.obs;
  var pincode = ''.obs;
  var district = ''.obs;
  var state = ''.obs;
  var pincodes = [].obs;

  generateParams() {
    return {
      'search': pincode.value,
    };
  }

  searchPincode(String pincode) {
    this.pincode.value = pincode;
    if (this.pincode.value.length == 6) {
      getSearchPincode();
    }
  }

  setLocation(Pincode pincode) async {
    this.pincode.value = pincode.pincode!;
    this.district.value = pincode.district!;
    this.state.value = pincode.state!;
    this.location.value = pincode.district! + ', ' + pincode.state!;
    await UserSimplePreferences.setPincode(pincode.pincode!);
    await UserSimplePreferences.setDistrict(pincode.district!);
    await UserSimplePreferences.setState(pincode.state!);
    Get.back();
  }

  getSearchPincode() async {
    print('getSearchPincode');
    var result;
    try {
      isLoading.value = true;
      var feedback = await ApiManager.fetchData(
          api: Api.searchPincode, params: generateParams());
      if (feedback != null) {
        result = SearchPincodeModel.fromJson(feedback);
        status.value = result.sts;
        message.value = result.msg;
      } else {}
    } finally {
      if (status.value == '01') {
        isLoading.value = false;
        pincodes.value = result.pincodes;
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

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  Future<void> getAddressFromLocation(Position position) async {
    print('getting address');
    List<Placemark> placeMarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placeMarks);
    Placemark place = placeMarks[0];
    print(place.postalCode);
    pincode.value = place.postalCode!;
    location.value = place.locality!;
    district.value = place.subAdministrativeArea!;
    state.value = place.administrativeArea!;
    await setPrefrences();
    if (pincode.value == '') {
      getCurrentLocation();
    }
  }

  setPrefrences() async {
    await UserSimplePreferences.setPincode(pincode.value);
    await UserSimplePreferences.setDistrict(district.value);
    await UserSimplePreferences.setState(state.value);
  }

  getCurrentLocation() async {
    Position position = await _determinePosition();
    print(position.latitude);
    await getAddressFromLocation(position);
  }
}
