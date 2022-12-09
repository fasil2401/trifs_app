import 'dart:developer' as developer;
import 'package:get/get.dart';
import 'package:trifs_app/Services/api_services.dart';
import 'package:trifs_app/model/Explore%20Model/gallery_model.dart';
import 'package:trifs_app/model/Tour%20Model/list_tour_package_model.dart';
import 'package:trifs_app/model/Tour%20Model/tour_package_single_model.dart' as single;
import 'package:trifs_app/model/video_list_model.dart';
import 'package:trifs_app/utils/constants/api_constants.dart';
import 'package:trifs_app/view/ToursScreen/tour_package_single.dart';

class TourController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getTourPackages();
  }

  var isLoading = false.obs;
  var status = ''.obs;
  var message = ''.obs;
  var tourPackages = [].obs;
  var tourPackage = single.Package().obs;
  var agency = single.Agency().obs;
  var imageList = [].obs;
  var videoList = [].obs;

  generateParams() {
    return {
      'type': 'Houseboat',
    };
  }

  getTourPackages() async {
    print('getTourPackages');
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
        tourPackages.value = result.packages;
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

  getSingleTourPackage(int id) async {
    isLoading.value = true;
    print('ID: $id');
    Get.to(() => TourPackageSingle());
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
