import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:sizer/sizer.dart';
import 'package:trifs_app/utils/constants/colors.dart';
import 'package:trifs_app/view/Components/app_bar.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({super.key});
  final List<String> imageList = [
    "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg",
    "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: TrifsAppBar(
          title: 'Explore Screen',
          isLocation: true,
        ),
      ),
      body: Column(
        children: [
          GFCarousel(
            aspectRatio: 18 / 9,
            viewportFraction: 0.8,
            enlargeMainPage: true,
            items: imageList.map(
              (url) {
                return Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Image.network(url,
                            fit: BoxFit.cover, width: 1000.0, height: 1000.0),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 15.0, left: 8.0),
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                        decoration: BoxDecoration(
                          color: AppColors.black.withOpacity(0.3),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Name',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 10.sp,
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
            ).toList(),
            onPageChanged: (index) {
              // setState(() {
              //   index;
              // });
            },
          )
        ],
      ),
    );
  }
}
