import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trifs_app/utils/app_calculations.dart';
import 'package:trifs_app/utils/constants/api_constants.dart';
import 'package:trifs_app/utils/constants/asset_path.dart';
import 'package:trifs_app/utils/constants/colors.dart';
import 'package:trifs_app/view/Components/loader.dart';
import 'package:trifs_app/view/HouseBoatScreen/houseboat_package_single.dart';

class RecommendedHouseBoatPackages extends StatelessWidget {
  RecommendedHouseBoatPackages({
    Key? key,
    required this.houseboats,
  }) : super(key: key);

  List<dynamic> houseboats = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 207,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: houseboats.length,
        separatorBuilder: (context, index) => SizedBox(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Get.to(() => HouseBoatPackageSingle());
            },
            child: Padding(
              padding: EdgeInsets.only(left: 8),
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    Container(
                      height: 130,
                      width: 220,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: CachedNetworkImage(
                          imageUrl: '${Api.imageUrl}${houseboats[index].image}',
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
                              borderRadius: BorderRadius.circular(15),
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
                    Container(
                      width: 220,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Text(
                                  houseboats[index].name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_pin,
                                    size: 12,
                                    color: Color(0xFF00A6F6),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: Text(
                                      houseboats[index].district,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: AppColors.green,
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '₹${houseboats[index].offerAmount}',
                                style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryColor),
                              ),
                              Text(
                                '₹${houseboats[index].budget}',
                                style: TextStyle(
                                    color: AppColors.grey,
                                    fontSize: 12,
                                    fontFamily: 'Lato',
                                    // line text
                                    decoration: TextDecoration.lineThrough),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '${AppCalculations.calculateOfferPercentage(price: houseboats[index].budget, offerPrice: houseboats[index].offerAmount).toString()}%Off',
                                style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.yellow),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
