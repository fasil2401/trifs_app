import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trifs_app/controller/app%20controls/travels_controller.dart';
import 'package:trifs_app/utils/constants/dummy_list.dart';
import 'package:trifs_app/view/Components/app_bar.dart';
import 'package:trifs_app/view/Components/carousel.dart';
import 'package:trifs_app/view/Components/custom_text.dart';
import 'package:trifs_app/view/Components/shimmer.dart';
import 'package:trifs_app/view/TravelScreen/components/travel_package_list.dart';
import 'package:trifs_app/view/TravelScreen/components/vehicle_category_slider.dart';

class TravelScreen extends StatelessWidget {
  TravelScreen({Key? key}) : super(key: key);
  final travelsController = Get.put(TravelsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: TrifsAppBar(
          title: 'Travel',
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
                VehicleCategoryList(),
                SizedBox(
                  height: 10,
                ),
                CustomText.buildTitleText(
                  title: 'Vehicles in Ollur...',
                ),
                Obx(() => travelsController.isLoading.value
                      ? AppShimmer.buildPackageVertShimmer()
                      : TravelPackage())
              ],
            ),
          )
        ],
      ),
    );
  }
}
