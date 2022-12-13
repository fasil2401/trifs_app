import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:trifs_app/controller/app%20controls/home_controller.dart';
import 'package:trifs_app/utils/constants/api_constants.dart';
import 'package:trifs_app/utils/constants/asset_path.dart';
import 'package:trifs_app/utils/constants/colors.dart';
import 'package:trifs_app/view/Components/loader.dart';

class TopAttractionSlider extends StatelessWidget {
  TopAttractionSlider({
    Key? key,
  }) : super(key: key);
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.h,
      child: Row(
        children: [
          Expanded(
            child: Obx(
              () => ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: homeController.attractions.length,
                itemBuilder: (context, index) {
                  var attraction = homeController.attractions[index];
                  return Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Container(
                          height: 18.h,
                          width: 28.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color(0xFFDCDCDC),
                          ),
                        ),
                        Container(
                          height: 17.h,
                          width: 30.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xFFAEAEAE)),
                        ),
                        Container(
                          //background image
                          height: 16.h,
                          width: 32.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            // image: DecorationImage(
                            //   image: AssetImage(
                            //     AppImages.placeHolderSquare,
                            //   ),
                            //   fit: BoxFit.cover,
                            // ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: CachedNetworkImage(
                              imageUrl: '${Api.imageUrl}${attraction.image}',
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
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              placeholder: (context, url) => Align(
                                  alignment: Alignment.center,
                                  child: AppLoader.imageLoader()),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 11,
                          left: 0,
                          child: Container(
                            width: 25.w,
                            decoration: BoxDecoration(
                              color: AppColors.yellow,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(5),
                                  bottomRight: Radius.circular(5)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4,
                              ),
                              child: Text(
                                attraction.name ?? '',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
