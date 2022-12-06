import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trifs_app/controller/app%20controls/house_boat_controller.dart';
import 'package:trifs_app/utils/app_calculations.dart';
import 'package:trifs_app/utils/constants/api_constants.dart';
import 'package:trifs_app/utils/constants/asset_path.dart';
import 'package:trifs_app/utils/constants/colors.dart';
import 'package:trifs_app/view/Components/loader.dart';
import 'package:trifs_app/view/HouseBoatScreen/houseboat_package_single.dart';

class DiscoverHouseBoatPackage extends StatelessWidget {
  DiscoverHouseBoatPackage({
    Key? key,
    required this.houseboats,
  }) : super(key: key);

  List<dynamic> houseboats = [];

  final houseBoatController = Get.put(HouseBoatController());

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: houseboats.length,
      separatorBuilder: (context, index) => SizedBox(
        height: 10,
      ),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          houseBoatController.getSingleHouseBoat(houseboats[index].id);
        },
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            // padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),

            child: Container(
              width: double.infinity,
              height: 135,
              child: Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            topLeft: Radius.circular(15)),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            topLeft: Radius.circular(15)),
                        child: CachedNetworkImage(
                          imageUrl: '${Api.imageUrl}${houseboats[index].image}',
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
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          placeholder: (context, url) => Align(
                              alignment: Alignment.center,
                              child: AppLoader.imageLoader()),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      // width: MediaQuery.of(context).size.width * 0.70,
                      padding: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            houseboats[index].name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(0.5)),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_pin,
                                size: 15,
                                color: Color(0xFF00A6F6),
                              ),
                              Text(
                                houseboats[index].district,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black.withOpacity(0.5),
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Verified',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black.withOpacity(0.5)),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      '${AppCalculations.calculateOfferPercentage(price: houseboats[index].budget, offerPrice: houseboats[index].offerAmount).toString()}%Off',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFFF6B100)),
                                    ),
                                    Text(
                                      '₹${houseboats[index].offerAmount}',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF00A6F6)),
                                    ),
                                    Text(
                                      '₹${houseboats[index].budget}',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16,
                                          // line text
                                          decoration:
                                              TextDecoration.lineThrough),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
