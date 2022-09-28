import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:trifs_app/utils/constants/asset_path.dart';
import 'package:trifs_app/view/Components/custom_text.dart';

List<int> list = [];

class MainPackageCardList extends StatelessWidget {
  MainPackageCardList({
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
          print('controller.packageData.value[index].agencyId');
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
                    child:
                        // controller.packageData.value[index].image!.isEmpty || controller.packageData.value[index].image == null
                        // ?
                        Image.asset(
                      AppImages.placeHolderLandscape,
                      fit: BoxFit.cover,
                    )
                    // : CachedNetworkImage(
                    //     imageUrl: Api.imageUrl + '${controller.packageData.value[index].image!}',
                    //     fit: BoxFit.cover,
                    // ),
                    ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomText.buildPackageTitle(title: 'Manali Trip'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      // Text('₹'),
                      Text(
                        '₹1000/-',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF00A6F6)),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        '₹1500/-',
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
                        '30%Off',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFF6B100)),
                      ),
                    ],
                  ),
                  Text(
                    'Athirapally',
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
      ),
    );
  }
}
