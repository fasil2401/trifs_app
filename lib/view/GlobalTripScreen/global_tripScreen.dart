import 'package:flutter/material.dart';
import 'package:trifs_app/utils/constants/dummy_list.dart';
import 'package:trifs_app/view/Components/app_bar.dart';
import 'package:trifs_app/view/Components/carousel.dart';
import 'package:trifs_app/view/Components/custom_text.dart';
import 'package:trifs_app/view/GlobalTripScreen/Components/global_trip_package_list.dart';
import 'package:trifs_app/view/ToursScreen/components/staggered_gallery.dart';
import 'package:trifs_app/view/ToursScreen/components/tours_districts.dart';

class GlobalTripScreen extends StatelessWidget {
  const GlobalTripScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: TrifsAppBar(
          title: 'Globel trip',
          isLocation: true,
        ),
      ),
      body: ListView(
        children: [
          PromotedCarousel(imageList: DummyList.imageList),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                CustomText.buildTitleText(
                  title: 'Kerala > Districts',
                ),
                TourDistricts(),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: CustomText.buildTitleText(
              title: 'Nearby Places',
            ),
          ),
          // EnlargingCarousel(imageList: DummyList.imageList),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText.buildTitleText(
                  title: 'Recommeneded Packages ',
                ),
                GlobalTripPackageCardList(),
                SizedBox(
                  height: 10,
                ),
                CustomText.buildTitleText(
                  title: 'Recommeneded Places',
                ),
                StaggeredGallery()
              ],
            ),
          )
        ],
      ),
    );
  }
}
