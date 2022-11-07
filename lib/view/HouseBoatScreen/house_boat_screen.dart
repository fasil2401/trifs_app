import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trifs_app/controller/app%20controls/house_boat_controller.dart';
import 'package:trifs_app/utils/constants/dummy_list.dart';
import 'package:trifs_app/view/Components/app_bar.dart';
import 'package:trifs_app/view/Components/carousel.dart';
import 'package:trifs_app/view/Components/custom_text.dart';
import 'package:trifs_app/view/Components/shimmer.dart';
import 'package:trifs_app/view/HouseBoatScreen/components/discover_housboat_list.dart';
import 'package:trifs_app/view/HouseBoatScreen/components/promoted_agency_slider.dart';
import 'package:trifs_app/view/HouseBoatScreen/components/recomended_houseboat.dart';

class HouseBoatScreen extends StatelessWidget {
  HouseBoatScreen({Key? key}) : super(key: key);

  final houseBoatController = Get.put(HouseBoatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: TrifsAppBar(
          title: 'HouseBoats',
          isLocation: true,
        ),
      ),
      body: ListView(
        children: [
          PromotedCarousel(imageList: DummyList.imageList),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText.buildTitleText(
                  title: 'Recomended Packages',
                ),
                Obx(
                  () => houseBoatController.isLoading.value
                      ? AppShimmer.buildPackageHoizShimmer()
                      : RecommendedHouseBoatPackages(
                          houseboats: houseBoatController.houseBoats,
                        ),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText.buildTitleText(
                  title: 'Promoted Agencies',
                ),
                Obx(() => houseBoatController.isLoading.value
                    ? AppShimmer.buildAgencySliderShimmer(context)
                    : PromotedAgencySlider(
                        agencies: houseBoatController.agencies,
                      )),
                CustomText.buildTitleText(
                  title: 'Discover HouseBoats',
                ),
                Obx(
                  () => houseBoatController.isLoading.value
                      ? AppShimmer.buildPackageVertShimmer()
                      : DiscoverHouseBoatPackage(
                          houseboats: houseBoatController.houseBoats,
                        ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
