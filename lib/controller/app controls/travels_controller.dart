import 'dart:developer' as developer;
import 'package:get/get.dart';
import 'package:trifs_app/Services/api_services.dart';
import 'package:trifs_app/model/Agency%20Model/agency_model.dart'
    as agencyModel;
import 'package:trifs_app/model/Explore%20Model/gallery_model.dart';
import 'package:trifs_app/model/Explore%20Model/list_places_model.dart';
import 'package:trifs_app/model/House%20Boat%20Model/list_house_boat_model.dart';
import 'package:trifs_app/model/Travels%20Model/travels_list_model.dart';
import 'package:trifs_app/model/video_list_model.dart';
import 'package:trifs_app/utils/User%20Preferences/user_preference.dart';
import 'package:trifs_app/utils/constants/api_constants.dart';
import 'package:trifs_app/view/Explore%20Screen/Components/explore_package_single.dart';
import 'package:trifs_app/view/HouseBoatScreen/houseboat_package_single.dart';
import 'package:trifs_app/view/TravelScreen/travel_package_single.dart';

import '../../model/Travels Model/travels_single_model.dart' as single;

class TravelsController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getTravelsList();
  }

  var isLoading = false.obs;
  var status = ''.obs;
  var message = ''.obs;
  var travelsList = [].obs;
  var travels = single.Travel().obs;
  var agencies = [].obs;
  var agency = single.Agency().obs;
  var imageList = [].obs;
  var videoList = [].obs;

  generateParams() {
    return {
      'type': 'Houseboat',
    };
  }

  getTravelsList() async {
    print('getTravelsList');
    var result;
    try {
      isLoading.value = true;
      var feedback = await ApiManager.fetchData(
        api: Api.travels,
      );
      if (feedback != null) {
        result = TavelsListModel.fromJson(feedback);
        status.value = result.sts;
        message.value = result.msg;
        developer.log(result.travels.toString(), name: 'API DATA');
      } else {}
    } finally {
      if (status.value == '01') {
        isLoading.value = false;
        travelsList.value = result.travels;
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

  // getAgencies() async {
  //   print('getAgencies');
  //   var result;
  //   try {
  //     isLoading.value = true;
  //     var feedback =
  //         await ApiManager.fetchData(api: Api.agency, params: generateParams());
  //     if (feedback != null) {
  //       result = agencyModel.ListAgencyModel.fromJson(feedback);
  //       status.value = result.sts;
  //       message.value = result.msg;
  //       developer.log(result.agency.toString(), name: 'API DATA');
  //     } else {}
  //   } finally {
  //     if (status.value == '01') {
  //       isLoading.value = false;
  //       agencies.value = result.agency;
  //     } else {
  //       isLoading.value = false;
  //       Get.snackbar(
  //         'Error',
  //         message.value,
  //         snackPosition: SnackPosition.BOTTOM,
  //         duration: Duration(seconds: 1),
  //       );
  //     }
  //   }
  // }

  getSingleTravels(int id) async {
    isLoading.value = true;
    print('ID: $id');
    Get.to(() => TravelPackageSingle());
    var result;
    try {
      var feedback = await ApiManager.fetchData(api: '${Api.travels}/$id');
      if (feedback != null) {
        result = single.TravelsSingleModel.fromJson(feedback);
        status.value = result.sts;
        message.value = result.msg;
        travels.value = result.travel;
        agency.value = result.agency;
        await getSingleTravelsVideos(id);
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

  getSingleTravelsGallery(int id) async {
    // isLoading.value = true;
    var result;
    try {
      var feedback =
          await ApiManager.fetchData(api: '${Api.travels}/gallery/$id');
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

  getSingleTravelsVideos(int id) async {
    print('getSingleVideos($id)');
    // isLoading.value = true;
    var result;
    try {
      var feedback =
          await ApiManager.fetchData(api: '${Api.travels}/videos/$id');
      if (feedback != null) {
        result = VideoListModel.fromJson(feedback);
        status.value = result.sts;
        message.value = result.msg;
        getSingleTravelsGallery(id);
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
