import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:trifs_app/controller/app%20controls/explore_controller.dart';
import 'package:trifs_app/utils/constants/colors.dart';
import 'package:trifs_app/utils/constants/common_list.dart';

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
              onTap: () {},
              child: Column(
                children: [
                  Container(
                    height: 10.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          DistrictList.districtImages[index],
                        ),
                        fit: BoxFit.cover,
                      ),
                      color: AppColors.lightGrey,
                      borderRadius: BorderRadius.circular(20),
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
