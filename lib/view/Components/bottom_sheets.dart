import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:trifs_app/utils/constants/asset_path.dart';
import 'package:trifs_app/utils/constants/colors.dart';
import 'package:trifs_app/view/Components/category_slider.dart';
import 'package:trifs_app/view/Components/custom_text.dart';
import 'package:trifs_app/view/Components/single_bottom_switch.dart';
import 'package:trifs_app/view/ToursScreen/components/tour_packages_list.dart';

class AppBottomSheet {
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
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.center,
                  child: CustomText.buildPackageTitle(title: 'Select Location'),
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
                Expanded(
                    child: ListView.builder(
                  itemCount: 30,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Divider(
                          color: AppColors.lightGrey,
                          height: 0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              SvgPicture.asset(AppIcons.locationPin),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Kozhikode Rec, Kozhikode',
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
                    );
                  },
                ))
              ],
            ),
          ),
        );
      },
    );
  }

  static Future<dynamic> buildAgencySheet(BuildContext context) {
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
                        'Anshaj Travels',
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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      AppImages.placeHolderLandscape,
                      width: double.infinity,
                      height: 16.h,
                      fit: BoxFit.cover,
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
                  Text(
                      '42, 1st P.K Commercial Complex, 776, Cherooty Rd, Kozhikode, Kerala 673032'),
                  SizedBox(
                    height: 10,
                  ),
                  Text('License experied date : 22/09/2022'),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Listed Packages by Anshaj Travels >',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
