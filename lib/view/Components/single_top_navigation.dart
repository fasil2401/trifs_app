import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:trifs_app/utils/constants/asset_path.dart';
import 'package:trifs_app/view/SearchScreen/search_screen.dart';

class FixedTopNavigation extends StatelessWidget {
  const FixedTopNavigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              InkWell(
                onTap: () => Get.to(() => SearchScreen()),
                child: GlassmorphicContainer(
                  width: 40,
                  height: 40,
                  border: 0,
                  blur: 10,
                  borderRadius: 50,
                  shape: BoxShape.circle,
                  linearGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFFFFFF),
                        Color(0xFFFFFFF),
                      ],
                      stops: [
                        0.3,
                        1,
                      ]),
                  borderGradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFFFFFF).withAlpha(01),
                      Color(0xFFFFFFF).withAlpha(100),
                      Color(0xFFFFFFF).withAlpha(01),
                    ],
                    stops: [
                      0.2,
                      0.9,
                      1,
                    ],
                  ),
                  child: Center(
                      child: SvgPicture.asset(
                    AppIcons.search,
                    color: Colors.black,
                    width: 20,
                    height: 20,
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
