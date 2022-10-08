import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:sizer/sizer.dart';
import 'package:trifs_app/utils/constants/asset_path.dart';
import 'package:trifs_app/utils/constants/colors.dart';
import 'package:trifs_app/view/Components/gallery_tile.dart';
import 'package:trifs_app/view/Components/single_agency_tile.dart';
import 'package:trifs_app/view/Components/single_description_text.dart';
import 'package:trifs_app/view/Components/single_bottom_switch.dart';
import 'package:trifs_app/view/Components/single_top_navigation.dart';
import 'package:trifs_app/view/Components/vodcast_tile.dart';

class TravelPackageSingle extends StatelessWidget {
  TravelPackageSingle({Key? key}) : super(key: key);

  String content =
      'The Indian rupee is the official currency of India. The rupee is subdivided into 100 paise, though as of 2019, coins of denomination of 1 rupee is the lowest value in use. The issuance of the currency is controlled by the Reserve Bank of India.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              clipBehavior: Clip.none,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(color: Colors.white),
                    child: Column(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              height: 60.h,
                              width: double.infinity,
                              color: AppColors.primaryColor,
                              child: Image.asset(
                                AppImages.placeHolderSquare,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                                bottom: 75,
                                width: MediaQuery.of(context).size.width,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 18),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.80,
                                                child: RichText(
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: 'GWagon Benz',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: AppColors
                                                                .white),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    AppIcons.mainLocation,
                                                    color:
                                                        AppColors.primaryColor,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    'Kerala',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        // fontWeight: FontWeight.bold,
                                                        color: Colors.white70),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.chair,
                                                    color: AppColors.white,
                                                    size: 18,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    '4 seats',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        // fontWeight: FontWeight.bold,
                                                        color: AppColors.white),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          InkWell(
                                            onTap: () async {},
                                            child: Icon(
                                              Icons.favorite,
                                              size: 30,
                                              color: AppColors.red,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                            Positioned(
                              bottom: 0,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12),
                                    child: Text(
                                      'Price Starts from ₹2000/-',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.white),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xff00A6F6),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(40),
                                    topRight: Radius.circular(40),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          color: Color(0xff00A6F6),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.65,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40)),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: DefaultTabController(
                                    length: 3,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 4,
                                              right: 8,
                                              left: 8,
                                              bottom: 8),
                                          child: Container(
                                            height: 40,
                                            // width: 95,
                                            // margin: const EdgeInsets.only(
                                            //     top: 20, left: 20, right: 20),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              // border: Border.all(
                                              //     color: Colors.grey.shade400,
                                              //     width: 0),
                                            ),
                                            child: TabBar(
                                              labelStyle: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                              unselectedLabelStyle: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                              indicator: BoxDecoration(
                                                color: Color(0xffE5E5E5),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              // isScrollable: true,
                                              labelColor: Colors.black,
                                              unselectedLabelColor:
                                                  Colors.black,
                                              tabs: [
                                                Text(
                                                  'Description',
                                                ),

                                                Text(
                                                  'Videos',
                                                ),
                                                Text(
                                                  'Gallery',
                                                ),
                                                // Icon(Icons.abc),
                                                // Icon(Icons.heart_broken),
                                                // Icon(Icons.verified_user),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          constraints: BoxConstraints(
                                            maxHeight: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.50,
                                            minHeight: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.50,
                                          ),
                                          child: TabBarView(
                                            children: <Widget>[
                                              SingleChildScrollView(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(height: 10),
                                                      DescriptioText
                                                          .buildContentText(
                                                              content),
                                                      SizedBox(height: 10),
                                                      DescriptioText
                                                          .buildHeadText(
                                                              'Agency'),
                                                      SizedBox(height: 10),
                                                      AgencySingleTile()
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 16),
                                                child: ListView.separated(
                                                  itemCount: 10,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return VodcastTile();
                                                  },
                                                  separatorBuilder:
                                                      (context, index) =>
                                                          SizedBox(
                                                    height: 5,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 16),
                                                // color: Colors.red,
                                                child: GridView.builder(
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  shrinkWrap: true,
                                                  gridDelegate:
                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 3,
                                                    crossAxisSpacing: 5,
                                                    mainAxisSpacing: 5,
                                                    mainAxisExtent: 28.w,
                                                  ),
                                                  itemCount: 10,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4),
                                                      child: GalleryTIle(),
                                                    );
                                                  },
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            FixedTopNavigation(),
            FixedBottomSwitch(),
          ],
        ),
      ),
    );
  }
}
