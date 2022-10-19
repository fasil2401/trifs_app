import 'package:flutter/material.dart';
import 'package:trifs_app/view/Components/app_bar.dart';
import 'package:trifs_app/view/Components/carousel.dart';
import 'package:trifs_app/view/Components/custom_text.dart';
import 'package:trifs_app/view/Explore%20Screen/Components/districts.dart';
import 'package:trifs_app/view/Explore%20Screen/Components/explore_package_list.dart';
import 'package:trifs_app/view/Explore%20Screen/Components/trending_slider.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({super.key});
  final List<String> imageList = [
    "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg",
    "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: TrifsAppBar(
          title: 'Explore',
          isLocation: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ExploreCarousel(imageList: imageList),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText.buildTitleText(
                    title: 'Kerala > Districts',
                  ),
                  KeralaWidget(),
                  SizedBox(
                    height: 10,
                  ),
                  CustomText.buildTitleText(
                    title: 'Trending Now',
                  ),
                  TrendingSlider(),
                  SizedBox(
                    height: 20,
                  ),
                  CustomText.buildTitleText(
                    title: 'Recommended Packages',
                  ),
                  ExplorePackageCardList(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
