import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:sizer/sizer.dart';
import 'package:trifs_app/controller/app%20controls/home_controller.dart';
import 'package:trifs_app/utils/constants/api_constants.dart';
import 'package:trifs_app/utils/constants/asset_path.dart';
import 'package:trifs_app/utils/constants/colors.dart';
import 'package:trifs_app/view/Components/loader.dart';

class PromotedCarousel extends StatefulWidget {
  const PromotedCarousel({super.key, required this.imageList});

  final List<String> imageList;
  @override
  State<PromotedCarousel> createState() => _PromotedCarouselState();
}

class _PromotedCarouselState extends State<PromotedCarousel> {
  @override
  Widget build(BuildContext context) {
    return GFCarousel(
      aspectRatio: 18 / 7,
      viewportFraction: 1.0,
      items: widget.imageList.map(
        (url) {
          return Stack(
            children: [
              Container(
                margin: EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Image.network(url, fit: BoxFit.cover, width: 1000.0),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: EdgeInsets.only(top: 8.0, left: 8.0),
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  decoration: BoxDecoration(
                    color: AppColors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Promoted',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 10.sp,
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ).toList(),
      onPageChanged: (index) {
        setState(() {
          index;
        });
      },
    );
  }
}

class EnlargingCarousel extends StatefulWidget {
  const EnlargingCarousel({
    super.key,
  });

  @override
  State<EnlargingCarousel> createState() => _EnlargingCarouselState();
}

class _EnlargingCarouselState extends State<EnlargingCarousel> {
  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return GFCarousel(
      aspectRatio: 18 / 9,
      viewportFraction: 0.6,
      enlargeMainPage: true,
      items: homeController.places.map(
        (place) {
          return Stack(
            children: [
              Container(
                height: 170,
                margin: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: AppColors.lightGrey),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 110,
                      margin: EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        // image: DecorationImage(
                        //   image: NetworkImage(url),
                        //   fit: BoxFit.fill,
                        // ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: CachedNetworkImage(
                          imageUrl: '${Api.imageUrl}${place.image}',
                          // height: 10.h,
                          errorWidget: (context, url, error) => Container(
                            // height: 10.h,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  AppImages.placeHolderLandscape,
                                ),
                                fit: BoxFit.cover,
                              ),
                              color: AppColors.lightGrey,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          placeholder: (context, url) => Align(
                              alignment: Alignment.center,
                              child: AppLoader.imageLoader()),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: SizedBox(
                      child: Text(place.name,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ),
                  )),
            ],
          );
        },
      ).toList(),
      onPageChanged: (index) {
        setState(() {
          index;
        });
      },
    );
  }
}

class ExploreCarousel extends StatefulWidget {
  const ExploreCarousel({
    Key? key,
    required this.imageList,
  }) : super(key: key);

  final List<String> imageList;

  @override
  State<ExploreCarousel> createState() => _ExploreCarouselState();
}

class _ExploreCarouselState extends State<ExploreCarousel> {
  @override
  Widget build(BuildContext context) {
    return GFCarousel(
      aspectRatio: 20 / 9,
      viewportFraction: 0.8,
      enlargeMainPage: true,
      items: widget.imageList.map(
        (url) {
          return Stack(
            children: [
              Container(
                margin: EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Image.network(url,
                      fit: BoxFit.cover, width: 1000.0, height: 1000.0),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  margin: EdgeInsets.only(bottom: 15.0, left: 8.0),
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  decoration: BoxDecoration(
                    color: AppColors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Name',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 10.sp,
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ).toList(),
      onPageChanged: (index) {
        setState(() {
          index;
        });
      },
    );
  }
}
