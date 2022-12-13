import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:trifs_app/controller/app%20controls/home_controller.dart';
import 'package:trifs_app/utils/app_calculations.dart';
import 'package:trifs_app/utils/constants/api_constants.dart';
import 'package:trifs_app/utils/constants/asset_path.dart';
import 'package:trifs_app/utils/constants/colors.dart';
import 'package:trifs_app/view/Components/custom_text.dart';
import 'package:trifs_app/view/Components/loader.dart';
import 'package:trifs_app/view/Home%20Screen/recomended_package_single.dart';

List<int> list = [];

class MainPackageCardList extends StatelessWidget {
  MainPackageCardList({
    Key? key,
  }) : super(key: key);

  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: homeController.packages.length,
        separatorBuilder: (context, index) => SizedBox(
          height: 10,
        ),
        itemBuilder: (context, index) {
          var package = homeController.packages[index];
          return GestureDetector(
            onTap: () {
              // Get.to(() => RecomendedPackageSingle());
              homeController.getSinglePackage(package.id);
            },
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Container(
                    height: 18.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: CachedNetworkImage(
                        imageUrl: '${Api.imageUrl}${package.image}',
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
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomText.buildPackageTitle(
                          title: package.name.toString()),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          // Text('₹'),
                          Text(
                            '₹${package.offerAmount}/-',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF00A6F6)),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            '₹${package.avgAmount}/-',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                // line text
                                decoration: TextDecoration.lineThrough),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '${AppCalculations.calculateOfferPercentage(price: package.avgAmount, offerPrice: package.offerAmount).toString()}%Off',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFF6B100)),
                          ),
                        ],
                      ),
                      Text(
                        package.status.toString(),
                        style: TextStyle(
                          fontFamily: 'Lato',
                          color: Color.fromARGB(255, 102, 101, 101),
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
