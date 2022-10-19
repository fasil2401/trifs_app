import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trifs_app/utils/constants/asset_path.dart';
import 'package:trifs_app/utils/constants/colors.dart';
import 'package:trifs_app/view/Components/bottom_sheets.dart';
import 'package:trifs_app/view/SearchScreen/search_screen.dart';

class TrifsAppBar extends StatelessWidget {
  final String title;
  final bool isLocation;
  const TrifsAppBar({
    Key? key,
    required this.title,
    required this.isLocation,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      automaticallyImplyLeading: true,
      actions: [
        IconButton(
          splashColor: AppColors.primaryColor.withOpacity(0.5),
          splashRadius: 20,
          onPressed: () {
            Get.to(() => SearchScreen());
          },
          icon: SvgPicture.asset(
            AppIcons.search,
            color: AppColors.primaryColor,
            width: 23,
            height: 23,
          ),
        ),
        Visibility(
          visible: isLocation,
          child: IconButton(
            splashColor: AppColors.primaryColor.withOpacity(0.5),
            splashRadius: 20,
            onPressed: () {
              AppBottomSheet.buildLocationSheet(context);
            },
            icon: SvgPicture.asset(
              AppIcons.locationExplore,
              color: AppColors.primaryColor,
              width: 25,
              height: 25,
            ),
          ),
        ),
      ],
    );
  }
}
