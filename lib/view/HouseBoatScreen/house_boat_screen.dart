import 'package:flutter/material.dart';
import 'package:trifs_app/utils/constants/dummy_list.dart';
import 'package:trifs_app/view/Components/app_bar.dart';
import 'package:trifs_app/view/Components/carousel.dart';
import 'package:trifs_app/view/Components/custom_text.dart';
import 'package:trifs_app/view/HouseBoatScreen/components/discover_housboat_list.dart';
import 'package:trifs_app/view/HouseBoatScreen/components/promoted_agency_slider.dart';
import 'package:trifs_app/view/HouseBoatScreen/components/recomended_houseboat.dart';

class HouseBoatScreen extends StatelessWidget {
  const HouseBoatScreen({Key? key}) : super(key: key);

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
                RecommendedHouseBoatPackages(),
                SizedBox(
                  height: 10,
                ),
                CustomText.buildTitleText(
                  title: 'Promoted Agencies',
                ),
                PromotedAgencySlider(),
                CustomText.buildTitleText(
                  title: 'Discover HouseBoats',
                ),
                DiscoverHouseBoatPackage()
              ],
            ),
          )
        ],
      ),
    );
  }
}
