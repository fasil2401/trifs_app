import 'package:flutter/material.dart';
import 'package:trifs_app/utils/constants/common_list.dart';
import 'package:trifs_app/view/Components/bottom_sheets.dart';

class TourDistricts extends StatelessWidget {
  const TourDistricts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        // physics: NeverScrollableScrollPhysics(),
        // shrinkWrap: true,
        itemCount:
            //data.length,
            DistrictList.districtImages.length,
        separatorBuilder: (context, index) => SizedBox(),
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(right: 12),
          child: GestureDetector(
            onTap: () {
              AppBottomSheet.buildPackageSheet(context);
            },
            child: Column(
              children: [
                Container(
                  //background image
                  height: 75,
                  width: 75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    image: DecorationImage(
                      image: AssetImage(
                        DistrictList.districtImages[index],
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    DistrictList.districtNames[index],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
