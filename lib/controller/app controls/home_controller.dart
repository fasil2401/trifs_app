import 'dart:developer' as developer;
import 'package:get/get.dart';
import 'package:trifs_app/Services/api_services.dart';
import 'package:trifs_app/model/Attraction%20Model/attractions_list_model.dart';
import 'package:trifs_app/model/Explore%20Model/gallery_model.dart';
import 'package:trifs_app/model/Explore%20Model/list_places_model.dart';
import 'package:trifs_app/model/Tour%20Model/list_tour_package_model.dart';
import 'package:trifs_app/model/Tour%20Model/tour_package_single_model.dart'
    as single;
import 'package:trifs_app/model/video_list_model.dart';
import 'package:trifs_app/utils/User%20Preferences/user_preference.dart';
import 'package:trifs_app/utils/constants/api_constants.dart';
import 'package:trifs_app/view/Home%20Screen/recomended_package_single.dart';
import 'package:trifs_app/view/ToursScreen/tour_package_single.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getPackages();
    getAttractions();
  }

  var isLoading = false.obs;
  var isAttractionsLoading = false.obs;
  var isPlacesLoading = false.obs;
  var status = ''.obs;
  var message = ''.obs;
  var packages = [].obs;
  var attractions = [].obs;
  var tourPackage = single.Package().obs;
  var agency = single.Agency().obs;
  var imageList = [].obs;
  var videoList = [].obs;
  var places = [].obs;

  generateParams() {
    final String district = UserSimplePreferences.getDistrict() ?? '';
    final String state = UserSimplePreferences.getState() ?? '';
    return {
      'state': state,
      'district': district,
    };
  }

  getPackages() async {
    var result;
    try {
      isLoading.value = true;
      var feedback = await ApiManager.fetchData(
        api: Api.packages,
      );
      if (feedback != null) {
        result = TourPackagesModel.fromJson(feedback);
        status.value = result.sts;
        message.value = result.msg;
        developer.log(result.packages.toString(), name: 'API DATA');
      } else {}
    } finally {
      if (status.value == '01') {
        isLoading.value = false;
        packages.value = result.packages;
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

  getAttractions() async {
    var result;
    try {
      isAttractionsLoading.value = true;
      var feedback = await ApiManager.fetchData(
        api: Api.attractions,
      );
      if (feedback != null) {
        result = AttractionsListModel.fromJson(feedback);
        status.value = result.sts;
        message.value = result.msg;
        developer.log(result.attractions.toString(), name: 'API DATA');
      } else {}
    } finally {
      if (status.value == '01') {
        isAttractionsLoading.value = false;
        attractions.value = result.attractions;
      } else {
        isAttractionsLoading.value = false;
        Get.snackbar(
          'Error',
          message.value,
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 1),
        );
      }
    }
  }

    getNearByPlaces() async {
    var result;
    try {
      isPlacesLoading.value = true;
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
        isPlacesLoading.value = false;
        places.value = result.places;
      } else {
        isPlacesLoading.value = false;
        Get.snackbar(
          'Error',
          message.value,
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 1),
        );
      }
    }
  }


  getSinglePackage(int id) async {
    isLoading.value = true;
    print('ID: $id');
    Get.to(() => RecomendedPackageSingle());
    var result;
    try {
      var feedback = await ApiManager.fetchData(api: '${Api.packages}/$id');
      if (feedback != null) {
        result = single.TourPackageSingleModel.fromJson(feedback);
        status.value = result.sts;
        message.value = result.msg;
        tourPackage.value = result.package;
        agency.value = result.agency;
        await getSingleTourPackageVideos(id);
        developer.log(agency.value.name.toString(), name: 'Agency NAme');
      } else {}
    } finally {
      if (status.value == '01') {
        // getSingleHouseBoatGallery(id);

        isLoading.value = false;
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

  getSingleTourPackageGallery(int id) async {
    // isLoading.value = true;
    var result;
    try {
      var feedback =
          await ApiManager.fetchData(api: '${Api.packages}/gallery/$id');
      if (feedback != null) {
        result = ExploreGalleryModel.fromJson(feedback);
        status.value = result.sts;
        message.value = result.msg;
      } else {}
    } finally {
      if (status.value == '01') {
        // await getSingleHouseBoatVideos(id);
        // isLoading.value = false;

        imageList.value = result.images;
        developer.log(imageList.length.toString(), name: 'image length');
      } else {
        // isLoading.value = false;
        Get.snackbar(
          'Error',
          message.value,
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 1),
        );
      }
    }
  }

  getSingleTourPackageVideos(int id) async {
    print('getSingleTourVideos($id)');
    // isLoading.value = true;
    var result;
    try {
      var feedback =
          await ApiManager.fetchData(api: '${Api.packages}/videos/$id');
      if (feedback != null) {
        result = VideoListModel.fromJson(feedback);
        status.value = result.sts;
        message.value = result.msg;
        getSingleTourPackageGallery(id);
      } else {}
    } finally {
      if (status.value == '01') {
        // isLoading.value = false;
        videoList.value = result.videos;
        developer.log(videoList.length.toString(), name: 'video length');
      } else {
        // isLoading.value = false;
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
