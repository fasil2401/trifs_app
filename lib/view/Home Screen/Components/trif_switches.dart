import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:trifs_app/utils/constants/asset_path.dart';

class Switches extends StatelessWidget {
  Switches({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 1.0,
          // crossAxisSpacing: 10.0,
          // mainAxisSpacing: 10.0,
        ),
        children: List.generate(
          trifSwitches.length,
          (index) => SwitchesCard(
            categoryList: trifSwitches[index],
          ),
        ),
      ),
    );
  }
}

class SwitchesCard extends StatelessWidget {
  final SwitchesList categoryList;

  SwitchesCard({
    Key? key,
    required this.categoryList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {
          print('trip switches clicked');
          Get.toNamed('/trip-switches-webview', arguments: [
            categoryList.url,
            categoryList.title,
          ]);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              categoryList.image,
              height: 10.w,
              width: 10.h,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              categoryList.title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12.sp,
                fontFamily: 'Lato',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SwitchesList {
  final String image;
  final String title;
  final String url;

  SwitchesList({required this.url, required this.image, required this.title});
}

List<SwitchesList> trifSwitches = <SwitchesList>[
  SwitchesList(
      image: AppImages.zomatoSwitch,
      title: 'Zomato',
      url: 'https://www.zomato.com/'),
  SwitchesList(
      image: AppImages.olaSwitch,
      title: 'Ola',
      url: 'https://www.olacabs.com/'),
  SwitchesList(
      image: AppImages.oyoSwitch,
      title: 'Oyo',
      url: 'https://www.oyorooms.com/'),
  SwitchesList(
      image: AppImages.redbusSwitch,
      title: 'Redbus',
      url: 'https://www.redbus.in/'),
  SwitchesList(
      image: AppImages.uberSwitch, title: 'Uber', url: 'https://m.uber.com'),
  SwitchesList(
      image: AppImages.swiggySwitch,
      title: 'Swiggy',
      url: 'https://www.swiggy.com/'),
  SwitchesList(
      image: AppImages.myShowSwitch,
      title: 'BookMy',
      url: 'https://in.bookmyshow.com/'),
  SwitchesList(
      image: AppImages.ereSwitch,
      title: 'zCharge',
      url: 'https://erebsindia.com/'),
];
