import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getwidget/getwidget.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:sizer/sizer.dart';
import 'package:trifs_app/utils/constants/asset_path.dart';
import 'package:trifs_app/utils/constants/colors.dart';
import 'package:trifs_app/view/Components/promoted_carousel.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: 45.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
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
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  _buildLocationWidget(),
                  _buildText(),
                  _buildSearchWidget(),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Column(
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
                              onTap: () {},
                              comingSoon: false,
                            ),
                            _buildHomeIcons(
                              asset: AppIcons.globaltravel,
                              title: 'Global Trip',
                              onTap: () {},
                              comingSoon: false,
                            ),
                            _buildHomeIcons(
                              asset: AppIcons.houseboat,
                              title: 'House Boat',
                              onTap: () {},
                              comingSoon: false,
                            ),
                            _buildHomeIcons(
                              asset: AppIcons.travel,
                              title: 'Travel',
                              onTap: () {},
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
                        PromotedCarousel(imageList: imageList),
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

  Container _buildSearchWidget() {
    return Container(
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
            child: Icon(Icons.search, color: AppColors.white, size: 40),
          ),
        ],
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

  Padding _buildLocationWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Align(
        alignment: Alignment.topRight,
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
                    child: Text('Thiruvananthapuram, Kerala',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: AppColors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600)),
                  ),
                ),
                CircleAvatar(
                  radius: 17,
                  backgroundColor: AppColors.primaryColor.withOpacity(0.8),
                  child:
                      Icon(Icons.location_on, color: AppColors.white, size: 20),
                ),
              ],
            )),
      ),
    );
  }
}
