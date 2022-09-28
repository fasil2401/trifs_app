import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:trifs_app/utils/constants/asset_path.dart';
import 'package:trifs_app/utils/constants/colors.dart';


class TopAttractionSlider extends StatelessWidget {
  const TopAttractionSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
          )
        ],
      ),
    );
  }
}
