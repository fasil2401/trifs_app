import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:sizer/sizer.dart';
import 'package:trifs_app/utils/constants/colors.dart';

class PromotedCarousel extends StatefulWidget {
  const PromotedCarousel({super.key, required this.imageList});

final List<String> imageList;
  @override
  State<PromotedCarousel> createState() => _PromotedCarouselState();
}

class _PromotedCarouselState extends State<PromotedCarousel> {
  @override
  Widget build(BuildContext context) {
    return GFCarousel(
      aspectRatio: 18 / 7,
      viewportFraction: 1.0,
      items: widget.imageList.map(
        (url) {
          return Stack(
            children: [
              Container(
                margin: EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Image.network(url, fit: BoxFit.cover, width: 1000.0),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: EdgeInsets.only(top: 8.0, left: 8.0),
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  decoration: BoxDecoration(
                    color: AppColors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Promoted',
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
        setState(() {
          index;
        });
      },
    );
  }
}
