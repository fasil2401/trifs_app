import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:sizer/sizer.dart';
import 'package:trifs_app/controller/app%20controls/explore_controller.dart';
import 'package:trifs_app/utils/constants/api_constants.dart';
import 'package:trifs_app/utils/constants/asset_path.dart';
import 'package:trifs_app/utils/constants/colors.dart';
import 'package:trifs_app/utils/constants/common_list.dart';
import 'package:trifs_app/view/Explore%20Screen/Components/explore_package_single.dart';

class KeralaWidget extends StatelessWidget {
  KeralaWidget({
    Key? key,
  }) : super(key: key);

  final exploreController = Get.put(ExploreController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      //height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Obx(
        () => GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 15,
            mainAxisSpacing: 14,
            mainAxisExtent: 13.h,
          ),
          itemCount: exploreController.places.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                exploreController
                    .getSinglePlace(exploreController.places[index].id);
              },
              child: Column(
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        '${Api.imageUrl}${exploreController.places[index].image}',
                    height: 10.h,
                    errorWidget: (context, url, error) => Container(
                      height: 10.h,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            AppImages.placeHolderSquare,
                          ),
                          fit: BoxFit.cover,
                        ),
                        color: AppColors.lightGrey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    placeholder: (context, url) => Align(
                      alignment: Alignment.center,
                      child: GFLoader(
                        type: GFLoaderType.circle,
                        loaderColorOne: AppColors.primaryColor,
                        loaderColorTwo: AppColors.primaryColor,
                        loaderColorThree: AppColors.primaryColor,
                        size: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: Text(
                      '${exploreController.places[index].name}',
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
