import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getCurrentLocation();
  }

  var location = 'Select Location'.obs;
  var pinCode = ''.obs;

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
    pinCode.value = place.postalCode!;
    location.value = place.locality!;
    if (pinCode.value == '') {
      getCurrentLocation();
    }
  }

  getCurrentLocation() async {
    Position position = await _determinePosition();
    print(position.latitude);
    await getAddressFromLocation(position);
  }
}
