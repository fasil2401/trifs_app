import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:sizer/sizer.dart';
import 'package:trifs_app/controller/app%20controls/location_controller.dart';
import 'package:trifs_app/utils/constants/api_constants.dart';
import 'package:trifs_app/utils/constants/asset_path.dart';
import 'package:trifs_app/utils/constants/colors.dart';
import 'package:trifs_app/view/Components/category_slider.dart';
import 'package:trifs_app/view/Components/custom_text.dart';
import 'package:trifs_app/view/Components/loader.dart';
import 'package:trifs_app/view/Components/single_bottom_switch.dart';
import 'package:trifs_app/view/ToursScreen/components/tour_packages_list.dart';

class AppBottomSheet {
  static final locationController = Get.put(LocationController());

  static Future<dynamic> buildLocationSheet(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      context: context,
      builder: (context) {
        return Container(
          height: 70.h,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.center,
                  child: CustomText.buildPackageTitle(
                    title: 'Select Location',
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'Search Pincode',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: CircleAvatar(
                        backgroundColor: AppColors.primaryColor,
                        child: SvgPicture.asset(
                          AppIcons.search,
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                    fillColor: AppColors.lightGrey,
                  ),
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  onChanged: (value) {
                    locationController.searchPincode(value);
                  },
                  onFieldSubmitted: (value) =>
                      locationController.searchPincode(value),
                  // onSaved: (value) => locationController.searchPincode(value!),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SvgPicture.asset(AppIcons.detectLocation),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Detect Location',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Obx(
                  () => Expanded(
                    child: locationController.isLoading.value
                        ? Align(
                            alignment: Alignment.topCenter,
                            child: GFLoader(type: GFLoaderType.circle),
                          )
                        : locationController.pincodes.isEmpty
                            ? Align(
                                alignment: Alignment.topCenter,
                                child: CustomText.buildPackageTitle(
                                  title: 'No Location Found',
                                ),
                              )
                            : ListView.builder(
                                itemCount: locationController.pincodes.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      locationController.setLocation(
                                        locationController.pincodes[index],
                                      );
                                    },
                                    child: Column(
                                      children: [
                                        Divider(
                                          color: AppColors.lightGrey,
                                          height: 0,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 10,
                                          ),
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(
                                                AppIcons.locationPin,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                '${locationController.pincodes[index].city}, ${locationController.pincodes[index].district}',
                                                style: TextStyle(
                                                  color: AppColors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          color: AppColors.lightGrey,
                                          height: 0,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Future<dynamic> buildAgencySheet(
      {required BuildContext context,
      required String name,
      required String image,
      required String license,
      required String address,
      required String phone,
      required bool isPremium}) {
    return showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      context: context,
      builder: (context) {
        return Container(
          height: 50.h,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.close,
                          color: AppColors.black,
                          size: 15,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: double.infinity,
                    height: 16.h,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl: '${Api.imageUrl}${image}',
                        // height: 10.h,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) => Container(
                          // height: 10.h,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                AppImages.placeHolderLandscape,
                              ),
                              fit: BoxFit.cover,
                            ),
                            color: AppColors.lightGrey,
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        placeholder: (context, url) => Align(
                            alignment: Alignment.center,
                            child: AppLoader.imageLoader()),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'PREMIUM',
                        style: TextStyle(
                          color: AppColors.yellow,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Icon(Icons.workspace_premium,
                          color: AppColors.yellow, size: 15),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(address),
                  SizedBox(
                    height: 10,
                  ),
                  Text('License experied date : ${license}'),
                  SizedBox(
                    height: 10,
                  ),
                  // Text(
                  //   'Listed Packages by Anshaj Travels >',
                  //   style: TextStyle(
                  //     color: AppColors.primaryColor,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  FixedBottomSwitch(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static Future<dynamic> buildPackageSheet(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      context: context,
      builder: (context) {
        return Container(
          height: 80.h,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Packages from Thrissur',
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.close,
                          color: AppColors.black,
                          size: 15,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        filled: true,
                        hintText: 'Search Location',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: CircleAvatar(
                            backgroundColor: AppColors.primaryColor,
                            child: SvgPicture.asset(
                              AppIcons.search,
                              width: 20,
                              height: 20,
                            ),
                          ),
                        ),
                        fillColor: AppColors.lightGrey),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CategoryScrollList(),
                  SizedBox(
                    height: 15,
                  ),
                  TourPackageCardList(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
