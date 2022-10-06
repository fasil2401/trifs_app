import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:trifs_app/utils/constants/asset_path.dart';
import 'package:trifs_app/utils/constants/colors.dart';
import 'package:trifs_app/view/Components/custom_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 20.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  image: DecorationImage(
                    image: AssetImage(AppImages.profileBackground),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        'Trifs User',
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: AppColors.secondaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Text(
                        '9876543210',
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: AppColors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 53.h,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText.buildTitleText(
                                  title: 'Dashboard',
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                _buildAccountRows(
                                  title: 'About Us',
                                  icon: AppIcons.about,
                                ),
                                SizedBox(
                                  height: 2.5.h,
                                ),
                                _buildAccountRows(
                                  title: 'Notifications',
                                  icon: AppIcons.notification,
                                ),
                                SizedBox(
                                  height: 2.5.h,
                                ),
                                _buildAccountRows(
                                  title: 'Privacy',
                                  icon: AppIcons.privacy,
                                ),
                                SizedBox(
                                  height: 2.5.h,
                                ),
                                _buildAccountRows(
                                  title: 'Terms & Conditions',
                                  icon: AppIcons.terms,
                                ),
                                SizedBox(
                                  height: 2.5.h,
                                ),
                                _buildAccountRows(
                                  title: 'Support',
                                  icon: AppIcons.support,
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                                _buildText(
                                  title: 'My Account',
                                  color: AppColors.grey,
                                ),
                                SizedBox(
                                  height: 3.5.h,
                                ),
                                _buildText(
                                  title: 'Change Password',
                                  color: AppColors.primaryColor,
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                _buildText(
                                  title: 'Logout',
                                  color: AppColors.red,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 8.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Account',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(
                  height: 2.h,
                ),
                CircleAvatar(
                  radius: 6.h,
                  backgroundColor: AppColors.primaryColor,
                  child: CircleAvatar(
                    radius: 5.8.h,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage(
                      AppImages.alappuzha,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Text _buildText({
    required String title,
    required Color color,
  }) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 12.sp,
        color: color,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Row _buildAccountRows({
    required String title,
    required String icon,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 16,
          backgroundColor: AppColors.primaryColor,
          child: SizedBox(
            height: 25,
            width: 25,
            child: SvgPicture.asset(icon),
          ),
        ),
        SizedBox(
          width: 4.w,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            color: AppColors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: ClipOval(
              child: Container(
                height: 4.h,
                width: 4.h,
                color: AppColors.secondaryColor,
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.white,
                  size: 10,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
