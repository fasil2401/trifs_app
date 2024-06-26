import 'dart:developer' as developer;
import 'package:get/get.dart';
import 'package:trifs_app/Services/api_services.dart';
import 'package:trifs_app/model/Agency%20Model/agency_model.dart'
    as agencyModel;
import 'package:trifs_app/model/Explore%20Model/gallery_model.dart';
import 'package:trifs_app/model/Explore%20Model/list_places_model.dart';
import 'package:trifs_app/model/House%20Boat%20Model/house_boat_single_model.dart'
    as single;
import 'package:trifs_app/model/House%20Boat%20Model/list_house_boat_model.dart';
import 'package:trifs_app/model/video_list_model.dart';
import 'package:trifs_app/utils/User%20Preferences/user_preference.dart';
import 'package:trifs_app/utils/constants/api_constants.dart';
import 'package:trifs_app/view/Explore%20Screen/Components/explore_package_single.dart';
import 'package:trifs_app/view/HouseBoatScreen/houseboat_package_single.dart';

class HouseBoatController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getHouseBoats();
  }

  var isLoading = false.obs;
  var status = ''.obs;
  var message = ''.obs;
  var houseBoats = [].obs;
  var houseBoat = single.Houseboats(createdAt: DateTime.now()).obs;
  var agencies = [].obs;
  var agency = single.Agency(createdAt: DateTime.now()).obs;
  var imageList = [].obs;
  var videoList = [].obs;

  generateParams() {
    return {
      'type': 'Houseboat',
    };
  }

  getHouseBoats() async {
    print('getHouseBoats');
    var result;
    try {
      isLoading.value = true;
      var feedback = await ApiManager.fetchData(
        api: Api.houseboat,
      );
      if (feedback != null) {
        result = ListHouseBoatModel.fromJson(feedback);
        status.value = result.sts;
        message.value = result.msg;
        developer.log(result.houseboats.toString(), name: 'API DATA');
      } else {}
    } finally {
      getAgencies();
      if (status.value == '01') {
        isLoading.value = false;
        houseBoats.value = result.houseboats;
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

  getAgencies() async {
    print('getAgencies');
    var result;
    try {
      isLoading.value = true;
      var feedback =
          await ApiManager.fetchData(api: Api.agency, params: generateParams());
      if (feedback != null) {
        result = agencyModel.ListAgencyModel.fromJson(feedback);
        status.value = result.sts;
        message.value = result.msg;
        developer.log(result.agency.toString(), name: 'API DATA');
      } else {}
    } finally {
      if (status.value == '01') {
        isLoading.value = false;
        agencies.value = result.agency;
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

  getSingleHouseBoat(int id) async {
    isLoading.value = true;
    print('ID: $id');
    Get.to(() => HouseBoatPackageSingle());
    var result;
    try {
      var feedback = await ApiManager.fetchData(api: '${Api.houseboat}/$id');
      if (feedback != null) {
        result = single.SingleHouseBoatModel.fromJson(feedback);
        status.value = result.sts;
        message.value = result.msg;
        houseBoat.value = result.houseboats;
        agency.value = result.agency;
        await getSingleHouseBoatVideos(id);
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

  getSingleHouseBoatGallery(int id) async {
    // isLoading.value = true;
    var result;
    try {
      var feedback =
          await ApiManager.fetchData(api: '${Api.houseboat}/gallery/$id');
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

  getSingleHouseBoatVideos(int id) async {
    print('getSingleHouseBoatVideos($id)');
    // isLoading.value = true;
    var result;
    try {
      var feedback =
          await ApiManager.fetchData(api: '${Api.houseboat}/videos/$id');
      if (feedback != null) {
        result = VideoListModel.fromJson(feedback);
        status.value = result.sts;
        message.value = result.msg;
        getSingleHouseBoatGallery(id);
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
