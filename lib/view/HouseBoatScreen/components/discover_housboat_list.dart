import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trifs_app/utils/constants/asset_path.dart';
import 'package:trifs_app/view/HouseBoatScreen/houseboat_package_single.dart';

class DiscoverHouseBoatPackage extends StatelessWidget {
  DiscoverHouseBoatPackage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      separatorBuilder: (context, index) => SizedBox(
        height: 10,
      ),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          Get.to(() => HouseBoatPackageSingle());
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
    );
  }
}
