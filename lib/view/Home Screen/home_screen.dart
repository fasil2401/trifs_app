import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:sizer/sizer.dart';
import 'package:trifs_app/controller/app%20controls/location_controller.dart';
import 'package:trifs_app/utils/constants/asset_path.dart';
import 'package:trifs_app/utils/constants/colors.dart';
import 'package:trifs_app/utils/constants/dummy_list.dart';
import 'package:trifs_app/view/Components/bottom_sheets.dart';
import 'package:trifs_app/view/Components/custom_text.dart';
import 'package:trifs_app/view/Components/carousel.dart';
import 'package:trifs_app/view/Components/main_package.dart';
import 'package:trifs_app/view/Components/top_attraction_slider.dart';
import 'package:trifs_app/view/GlobalTripScreen/global_tripScreen.dart';
import 'package:trifs_app/view/Home%20Screen/Components/trif_switches.dart';
import 'package:trifs_app/view/Home%20Screen/Components/vodcast_homescreen.dart';
import 'package:trifs_app/view/HouseBoatScreen/house_boat_screen.dart';
import 'package:trifs_app/view/SearchScreen/search_screen.dart';
import 'package:trifs_app/view/ToursScreen/tour_screen.dart';
import 'package:trifs_app/view/TravelScreen/travel_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final locationController = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: 45.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.grey,
                image: DecorationImage(
                    image: AssetImage(
                      AppImages.homeBackground,
                    ),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.4), BlendMode.darken)),
              ),
            ),
            SingleChildScrollView(
              // physics: const BouncingScrollPhysics(),
              physics: const ClampingScrollPhysics(),
              child: Column(
                children: [
                  _buildLocationWidget(),
                  _buildText(),
                  _buildSearchWidget(),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.lightGrey,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildHomeIcons(
                              asset: AppIcons.tours,
                              title: 'Tours',
                              onTap: () {
                                Get.to(() =>  TourScreen());
                              },
                              comingSoon: false,
                            ),
                            _buildHomeIcons(
                              asset: AppIcons.globaltravel,
                              title: 'Global Trip',
                              onTap: () {
                                Get.to(() => const GlobalTripScreen());
                              },
                              comingSoon: false,
                            ),
                            _buildHomeIcons(
                              asset: AppIcons.houseboat,
                              title: 'House Boat',
                              onTap: () {
                                Get.to(() => HouseBoatScreen());
                              },
                              comingSoon: false,
                            ),
                            _buildHomeIcons(
                              asset: AppIcons.travel,
                              title: 'Travel',
                              onTap: () {
                                Get.to(() => TravelScreen());
                              },
                              comingSoon: false,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildHomeIcons(
                              asset: AppIcons.camping,
                              title: 'Camping',
                              onTap: () {},
                              comingSoon: true,
                            ),
                            _buildHomeIcons(
                              asset: AppIcons.resort,
                              title: 'Resort',
                              onTap: () {},
                              comingSoon: true,
                            ),
                            _buildHomeIcons(
                              asset: AppIcons.homestay,
                              title: 'Homestay',
                              onTap: () {},
                              comingSoon: true,
                            ),
                            _buildHomeIcons(
                              asset: AppIcons.trekking,
                              title: 'Trekking',
                              onTap: () {},
                              comingSoon: true,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        PromotedCarousel(imageList: DummyList.imageList),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText.buildTitleText(
                                  title: 'Top Attractions',
                                ),
                                TopAttractionSlider(),
                              ],
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        CustomText.buildTitleText(
                          title: 'Nearby Places',
                        ),
                        EnlargingCarousel(imageList: DummyList.imageList),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText.buildTitleText(
                                title: 'TrifSwitches',
                              ),
                              Switches(),
                              SizedBox(
                                height: 10,
                              ),
                              CustomText.buildTitleText(
                                title: 'Trifs Vodcasts',
                              ),
                              VodcastsHomePage(),
                              SizedBox(
                                height: 10,
                              ),
                              CustomText.buildTitleText(
                                title: 'Recommended Packages',
                              ),
                              MainPackageCardList(),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHomeIcons({
    required String asset,
    required String title,
    required bool comingSoon,
    required Function() onTap,
  }) {
    return Stack(
      children: [
        Container(
          width: 25.w,
          child: GestureDetector(
            onTap: onTap,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  asset,
                  height: 14.w,
                  width: 14.w,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
        Visibility(
          visible: comingSoon,
          child: Positioned(
            bottom: 20,
            right: 9,
            left: 9,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text('Comimg Soon',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 8.sp,
                  )),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchWidget() {
    return InkWell(
      onTap: () {
        Get.to(() => const SearchScreen());
      },
      child: Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                height: 50,
                padding: EdgeInsets.only(left: 30),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text('Search your needs....',
                    style: TextStyle(
                      color: AppColors.grey,
                      fontSize: 14,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SvgPicture.asset(
                AppIcons.search,
                width: 25,
                height: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Center _buildText() {
    return Center(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: SizedBox(
        child: Text(
          'Let’s Explore\nThe World',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.white,
            fontSize: 25.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ));
  }

  Widget _buildLocationWidget() {
    // getLocation();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Align(
        alignment: Alignment.topRight,
        child: InkWell(
          onTap: () => AppBottomSheet.buildLocationSheet(context),
          child: GlassmorphicContainer(
              alignment: Alignment.centerRight,
              width: 160,
              height: 35,
              border: 0,
              blur: 10,
              borderRadius: 50,
              linearGradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFFFFFF),
                    Color(0xFFFFFFF),
                  ],
                  stops: [
                    0.3,
                    1,
                  ]),
              borderGradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFFFFFF).withAlpha(01),
                    Color(0xFFFFFFF).withAlpha(100),
                    Color(0xFFFFFFF).withAlpha(01),
                  ],
                  stops: [
                    0.2,
                    0.9,
                    1,
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: SizedBox(
                      width: 110,
                      child: Obx(() => Text(locationController.location.value,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: AppColors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600))),
                    ),
                  ),
                  CircleAvatar(
                    radius: 17,
                    backgroundColor: AppColors.primaryColor.withOpacity(0.8),
                    child: SvgPicture.asset(
                      AppIcons.mainLocation,
                      width: 20,
                      height: 20,
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
