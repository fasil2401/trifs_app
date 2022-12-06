import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trifs_app/controller/app%20controls/house_boat_controller.dart';
import 'package:trifs_app/utils/constants/api_constants.dart';
import 'package:trifs_app/utils/constants/asset_path.dart';
import 'package:trifs_app/utils/constants/colors.dart';
import 'package:trifs_app/view/Components/bottom_sheets.dart';
import 'package:trifs_app/view/Components/loader.dart';

class PromotedAgencySlider extends StatelessWidget {
  PromotedAgencySlider({Key? key, required this.agencies}) : super(key: key);

  final houseBoatController = Get.put(HouseBoatController());

  List<dynamic> agencies = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.18,
      child: Obx(
        () => ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: houseBoatController.agencies.length,
          // itemCount: 1,
          separatorBuilder: (context, index) => SizedBox(
            width: 4,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Get.to(() => HouseBoatPackageSingle());
                print(agencies[index].logo);
                AppBottomSheet.buildAgencySheet(
                    context: context,
                    name: agencies[index].name,
                    address: agencies[index].address,
                    license: agencies[index].lisenceExpiry.toString(),
                    image: agencies[index].logo,
                    phone: agencies[index].phone,
                    isPremium: true);
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Container(
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 40,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: CachedNetworkImage(
                            imageUrl:
                                '${Api.imageUrl}${houseBoatController.agencies[index].logo}',
                            // height: 10.h,
                            errorWidget: (context, url, error) => Container(
                              // height: 10.h,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    AppImages.placeHolderSquare,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                color: AppColors.lightGrey,
                                borderRadius: BorderRadius.circular(40),
                              ),
                            ),
                            placeholder: (context, url) => Align(
                                alignment: Alignment.center,
                                child: AppLoader.imageLoader()),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: 80,
                        child: Text(
                          houseBoatController.agencies[index].name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
