import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:trifs_app/utils/constants/asset_path.dart';
import 'package:trifs_app/utils/constants/colors.dart';
import 'package:trifs_app/view/Components/custom_text.dart';
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
              _buildBottomSheet(context);
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

  Future<dynamic> _buildBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      context: context,
      builder: (context) {
        return Container(
          height: 70.h,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.center,
                  child: CustomText.buildPackageTitle(title: 'Your Location'),
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      filled: true,
                      hintText: 'Search Location',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: CircleAvatar(
                          backgroundColor: AppColors.primaryColor,
                          child: SvgPicture.asset(
                            AppIcons.search,
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ),
                      fillColor: AppColors.lightGrey),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SvgPicture.asset(AppIcons.detectLocation),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Detect Location',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: ListView.builder(
                  itemCount: 30,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Divider(
                          color: AppColors.lightGrey,
                          height: 0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              SvgPicture.asset(AppIcons.locationPin),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Kozhikode Rec, Kozhikode',
                                style: TextStyle(
                                  color: AppColors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: AppColors.lightGrey,
                          height: 0,
                        ),
                      ],
                    );
                  },
                ))
              ],
            ),
          ),
        );
      },
    );
  }
}
