import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:trifs_app/controller/app%20controls/explore_controller.dart';
import 'package:trifs_app/utils/constants/api_constants.dart';
import 'package:trifs_app/utils/constants/asset_path.dart';
import 'package:trifs_app/utils/constants/colors.dart';
import 'package:trifs_app/view/Components/custom_text.dart';
import 'package:trifs_app/view/Components/gallery_tile.dart';
import 'package:trifs_app/view/Components/single_description_text.dart';
import 'package:trifs_app/view/Components/single_top_navigation.dart';
import 'package:trifs_app/view/Explore%20Screen/Components/attraction_tile.dart';
import 'package:trifs_app/view/Explore%20Screen/Components/explore_package_list.dart';

class ExplorePackageSingle extends StatelessWidget {
  ExplorePackageSingle({Key? key}) : super(key: key);

  final exploreController = Get.put(ExploreController());

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
            child: Obx(
              () => Column(
                children: [
                  Container(
                    decoration: BoxDecoration(color: Colors.white),
                    child: Column(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            CachedNetworkImage(
                              imageUrl:
                                  '${Api.imageUrl}${exploreController.place.value.image}',
                              height: 60.h,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                              errorWidget: (context, url, error) => Container(
                                height: 60.h,
                                width: double.infinity,
                                color: Colors.red,
                                child: Image.asset(
                                  AppImages.placeHolderSquare,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              placeholder: (context, url) => Align(
                                alignment: Alignment.center,
                                child: GFLoader(
                                  type: GFLoaderType.circle,
                                  loaderColorOne: AppColors.primaryColor,
                                  loaderColorTwo: AppColors.primaryColor,
                                  loaderColorThree: AppColors.primaryColor,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 30,
                              width: MediaQuery.of(context).size.width,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 18),
                                child: exploreController.isLoading.value
                                    ? _buildSecondShimmer(context)
                                    : Row(
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
                                                child: Text(
                                                  exploreController
                                                      .place.value.name!,
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
                                                exploreController
                                                    .place.value.state!,
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
                              ),
                            ),
                          ],
                        ),
                        Stack(
                          children: [
                            GlassmorphicContainer(
                              alignment: Alignment.centerRight,
                              width: double.infinity,
                              height: 35,
                              border: 0,
                              blur: 10,
                              borderRadius: 0,
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
                            ),
                            exploreController.isLoading.value
                                ? _buildMainShimmer(context)
                                : Container(
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
                                                          'History',
                                                        ),

                                                        Text(
                                                          'Attractions',
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
                                                              DescriptioText
                                                                  .buildContentText(
                                                                      exploreController
                                                                          .place
                                                                          .value
                                                                          .history!),
                                                              SizedBox(
                                                                  height: 10),
                                                              CustomText
                                                                  .buildTitleText(
                                                                title:
                                                                    'Recommended Packages',
                                                              ),
                                                              ExplorePackageCardList(),
                                                            ],
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
                                                                35.w,
                                                          ),
                                                          itemCount:
                                                              exploreController
                                                                  .attractions
                                                                  .length,
                                                          itemBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  int index) {
                                                            return Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(4),
                                                              child:
                                                                  AttractionTile(
                                                                imageUrl: exploreController
                                                                    .attractions[
                                                                        index]
                                                                    .image,
                                                                title: exploreController
                                                                    .attractions[
                                                                        index]
                                                                    .name,
                                                              ),
                                                            );
                                                          },
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
                                                              exploreController
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
                                                              child:
                                                                  GalleryTIle(
                                                                imageUrl:
                                                                    exploreController
                                                                        .imageList[
                                                                            index]
                                                                        .image,
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
                                  )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          FixedTopNavigation(),
        ],
      )),
    );
  }

  Widget _buildSecondShimmer(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.grey,
      highlightColor: AppColors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.70,
                color: AppColors.grey,
                child: Text(
                  '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.50,
                color: AppColors.grey,
                child: Text(
                  '',
                  style: TextStyle(
                      fontSize: 16,
                      // fontWeight: FontWeight.bold,
                      color: Colors.white70),
                ),
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
    );
  }

  Widget _buildMainShimmer(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.grey,
      highlightColor: AppColors.white,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.65,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40)),
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
                          top: 4, right: 8, left: 8, bottom: 8),
                      child: Container(
                        height: 40,
                        // width: 95,
                        // margin: const EdgeInsets.only(
                        //     top: 20, left: 20, right: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
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
                            borderRadius: BorderRadius.circular(20),
                          ),
                          // isScrollable: true,
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.black,
                          tabs: [
                            Text(
                              'History',
                            ),

                            Text(
                              'Attractions',
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
                        maxHeight: MediaQuery.of(context).size.height * 0.50,
                        minHeight: MediaQuery.of(context).size.height * 0.50,
                      ),
                      child: TabBarView(
                        children: <Widget>[
                          SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10),
                                  DescriptioText.buildContentText(content),
                                  SizedBox(height: 10),
                                  CustomText.buildTitleText(
                                    title: 'Recommended Packages',
                                  ),
                                  ExplorePackageCardList(),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            // color: Colors.red,
                            child: GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5,
                                mainAxisExtent: 35.w,
                              ),
                              itemCount: 10,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.all(4),
                                  // child: AttractionTile(),
                                );
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            // color: Colors.red,
                            child: GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5,
                                mainAxisExtent: 28.w,
                              ),
                              itemCount: 10,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.all(4),
                                  // child: GalleryTIle(),
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
    );
  }

// methods to get the shimmer

}
