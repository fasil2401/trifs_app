import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:trifs_app/controller/app%20controls/home_controller.dart';
import 'package:trifs_app/model/Agency%20Model/agency_model.dart';
import 'package:trifs_app/utils/constants/api_constants.dart';
import 'package:trifs_app/utils/constants/asset_path.dart';
import 'package:trifs_app/utils/constants/colors.dart';
import 'package:trifs_app/view/Components/gallery_tile.dart';
import 'package:trifs_app/view/Components/loader.dart';
import 'package:trifs_app/view/Components/single_agency_tile.dart';
import 'package:trifs_app/view/Components/single_description_text.dart';
import 'package:trifs_app/view/Components/single_bottom_switch.dart';
import 'package:trifs_app/view/Components/single_top_navigation.dart';
import 'package:trifs_app/view/Components/vodcast_tile.dart';

class RecomendedPackageSingle extends StatelessWidget {
  RecomendedPackageSingle({Key? key}) : super(key: key);

  String content =
      'The Indian rupee is the official currency of India. The rupee is subdivided into 100 paise, though as of 2019, coins of denomination of 1 rupee is the lowest value in use. The issuance of the currency is controlled by the Reserve Bank of India.';
  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => homeController.isLoading.value
              ? Container(
                  height: 100.h,
                  width: 100.w,
                  child: Center(
                    child: AppLoader.imageLoader(),
                  ),
                )
              : Stack(
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
                                      color: Colors.red,
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            '${Api.imageUrl}${homeController.tourPackage.value.image}',
                                        // height: 10.h,
                                        fit: BoxFit.cover,
                                        errorWidget: (context, url, error) =>
                                            Container(
                                          // height: 10.h,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                AppImages.placeHolderLandscape,
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                            color: AppColors.lightGrey,
                                            // borderRadius: BorderRadius.circular(15),
                                          ),
                                        ),
                                        placeholder: (context, url) => Align(
                                            alignment: Alignment.center,
                                            child: AppLoader.imageLoader()),
                                      ),
                                    ),
                                    Positioned(
                                        bottom: 75,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 18),
                                          child: Row(
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
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.80,
                                                    child: Text(
                                                      homeController.tourPackage
                                                              .value.name ??
                                                          '',
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontSize: 25,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    '',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        // fontWeight: FontWeight.bold,
                                                        color: Colors.white70),
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
                                        )),
                                    Positioned(
                                      bottom: 0,
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 50,
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12),
                                            child: Text(
                                              'Price Starts from ₹${homeController.tourPackage.value.offerAmount}/-',
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
                                    height: MediaQuery.of(context).size.height *
                                        0.65,
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
                                                  padding:
                                                      const EdgeInsets.only(
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
                                                          BorderRadius.circular(
                                                              20),
                                                      // border: Border.all(
                                                      //     color: Colors.grey.shade400,
                                                      //     width: 0),
                                                    ),
                                                    child: TabBar(
                                                      labelStyle: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black,
                                                      ),
                                                      unselectedLabelStyle:
                                                          TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black,
                                                      ),
                                                      indicator: BoxDecoration(
                                                        color:
                                                            Color(0xffE5E5E5),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
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
                                                    maxHeight:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.50,
                                                    minHeight:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.50,
                                                  ),
                                                  child: TabBarView(
                                                    children: <Widget>[
                                                      SingleChildScrollView(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                  height: 10),
                                                              DescriptioText.buildContentText(
                                                                  homeController
                                                                          .tourPackage
                                                                          .value
                                                                          .desc ??
                                                                      ''),
                                                              SizedBox(
                                                                  height: 10),
                                                              DescriptioText
                                                                  .buildHeadText(
                                                                      'Itinerary'),
                                                              SizedBox(
                                                                  height: 10),
                                                              DescriptioText.buildHighLightText(
                                                                  homeController
                                                                          .tourPackage
                                                                          .value
                                                                          .days ??
                                                                      ''),
                                                              SizedBox(
                                                                  height: 10),
                                                              DescriptioText
                                                                  .buildContentText(
                                                                      ''),
                                                              SizedBox(
                                                                  height: 10),
                                                              DescriptioText
                                                                  .buildHeadText(
                                                                      'Inclusion'),
                                                              SizedBox(
                                                                  height: 10),
                                                              DescriptioText.buildContentText(
                                                                  homeController
                                                                          .tourPackage
                                                                          .value
                                                                          .inclusion ??
                                                                      ''),
                                                              SizedBox(
                                                                  height: 10),
                                                              DescriptioText
                                                                  .buildHeadText(
                                                                      'Exclusion'),
                                                              SizedBox(
                                                                  height: 10),
                                                              DescriptioText.buildContentText(
                                                                  homeController
                                                                          .tourPackage
                                                                          .value
                                                                          .exclusion ??
                                                                      ''),
                                                              SizedBox(
                                                                  height: 10),
                                                              DescriptioText
                                                                  .buildHeadText(
                                                                      'Vehicle Details'),
                                                              SizedBox(
                                                                  height: 10),
                                                              DescriptioText.buildContentText(
                                                                  homeController
                                                                          .tourPackage
                                                                          .value
                                                                          .vechicleDetails ??
                                                                      ''),
                                                              SizedBox(
                                                                  height: 10),
                                                              DescriptioText
                                                                  .buildHeadText(
                                                                      'Cancellation Policy'),
                                                              SizedBox(
                                                                  height: 10),
                                                              DescriptioText.buildContentText(
                                                                  homeController
                                                                          .tourPackage
                                                                          .value
                                                                          .cancelationPolicy ??
                                                                      ''),
                                                              SizedBox(
                                                                  height: 10),
                                                              DescriptioText
                                                                  .buildHeadText(
                                                                      'Agency'),
                                                              SizedBox(
                                                                  height: 10),
                                                              AgencySingleTile(
                                                                agencyName: homeController
                                                                        .agency
                                                                        .value
                                                                        .name ??
                                                                    '',
                                                                agencyAddress:
                                                                    homeController
                                                                            .agency
                                                                            .value
                                                                            .address ??
                                                                        '',
                                                                agencyImage: homeController
                                                                        .agency
                                                                        .value
                                                                        .logo ??
                                                                    '',
                                                                isPremium: true,
                                                                licenceDate:
                                                                    homeController
                                                                        .agency
                                                                        .value
                                                                        .lisenceExpiry
                                                                        .toString(),
                                                                phone: homeController
                                                                    .agency
                                                                    .value
                                                                    .phone
                                                                    .toString(),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 16),
                                                        child:
                                                            ListView.separated(
                                                          itemCount:
                                                              homeController
                                                                  .videoList
                                                                  .length,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return VodcastTile();
                                                          },
                                                          separatorBuilder:
                                                              (context,
                                                                      index) =>
                                                                  SizedBox(
                                                            height: 5,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
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
                                                            mainAxisExtent:
                                                                28.w,
                                                          ),
                                                          itemCount:
                                                              homeController
                                                                  .imageList
                                                                  .length,
                                                          itemBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  int index) {
                                                            return Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(4),
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15),
                                                                ),
                                                                child:
                                                                    CachedNetworkImage(
                                                                  imageUrl:
                                                                      '${Api.imageUrl}${homeController.imageList[index].image}',
                                                                  // height: 10.h,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  errorWidget: (context,
                                                                          url,
                                                                          error) =>
                                                                      Container(
                                                                    // height: 10.h,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15),
                                                                      image:
                                                                          DecorationImage(
                                                                        image:
                                                                            AssetImage(
                                                                          AppImages
                                                                              .placeHolderSquare,
                                                                        ),
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                      color: AppColors
                                                                          .lightGrey,
                                                                      // borderRadius: BorderRadius.circular(15),
                                                                    ),
                                                                  ),
                                                                  placeholder: (context, url) => Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      child: AppLoader
                                                                          .imageLoader()),
                                                                ),
                                                              ),
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
      ),
    );
  }
}
