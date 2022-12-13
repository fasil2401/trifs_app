import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:trifs_app/utils/constants/asset_path.dart';
import 'package:trifs_app/utils/constants/colors.dart';
import 'package:trifs_app/view/HouseBoatScreen/components/discover_housboat_list.dart';
import 'package:trifs_app/view/HouseBoatScreen/components/recomended_houseboat.dart';

class AppShimmer {

  static buildAttractionSliderShimmer(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: 20.h,
        child: Row(
          children: [
            Expanded(
              child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Container(
                            height: 18.h,
                            width: 28.w,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(15),
                              color: Color(0xFFDCDCDC),
                            ),
                          ),
                          Container(
                            height: 17.h,
                            width: 30.w,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(15),
                                color: Color(0xFFAEAEAE)),
                          ),
                          Container(
                            //background image
                            height: 16.h,
                            width: 32.w,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(10.0),
                              image: DecorationImage(
                                image: AssetImage(
                                  AppImages.placeHolderSquare,
                                ),
                                fit: BoxFit.cover,
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
                                    bottomRight:
                                        Radius.circular(5)),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(
                                  horizontal: 4,
                                ),
                                child: Text(
                                  'name',
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight:
                                          FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    separatorBuilder: (context, index) =>
                        SizedBox(),
                  ),
            ),
          ],
        ),)
    );
  }

  static buildPackageHoizShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: 207,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          separatorBuilder: (context, index) => SizedBox(),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {},
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
                            child: Image.asset(
                              AppImages.placeHolderLandscape,
                              fit: BoxFit.cover,
                              width: 1000,
                            )),
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: Text(
                                    'River Woods',
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
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      child: Text(
                                        'Wayanad',
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
                                  '₹1000',
                                  style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryColor),
                                ),
                                Text(
                                  '₹1500',
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
                                  '20%Off',
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
      ),
    );
  }

  static buildPackageVertShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 10,
        separatorBuilder: (context, index) => SizedBox(
          height: 10,
        ),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {},
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
                            child: Image.asset(
                              AppImages.placeHolderSquare,
                              fit: BoxFit.cover,
                            )),
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
                              'River Woods',
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
                                  'Wayanad',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black.withOpacity(0.5),
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                        '20%Off',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFFF6B100)),
                                      ),
                                      Text(
                                        '₹1000',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF00A6F6)),
                                      ),
                                      Text(
                                        '₹1500/-',
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
      ),
    );
  }

  static buildAgencySliderShimmer(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.18,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          // itemCount: 1,
          separatorBuilder: (context, index) => SizedBox(
            width: 4,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {},
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
                            child: Image.asset(
                              AppImages.placeHolderSquare,
                              fit: BoxFit.cover,
                            )),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'River Woods',
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ))
    );
  }
}
