import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:trifs_app/model/Agency%20Model/agency_model.dart';
import 'package:trifs_app/utils/constants/api_constants.dart';
import 'package:trifs_app/utils/constants/asset_path.dart';
import 'package:trifs_app/utils/constants/colors.dart';
import 'package:trifs_app/view/Components/bottom_sheets.dart';
import 'package:trifs_app/view/Components/loader.dart';

class AgencySingleTile extends StatelessWidget {
  AgencySingleTile({
    Key? key,
    this.agencyName = 'Agency Name',
    this.agencyImage = AppImages.placeHolderLandscape,
    this.agencyAddress = 'Location',
    this.licenceDate = '2021-09-09',
    this.isPremium = true,
    this.phone = ''
  }) : super(key: key);

  final String agencyName;
  final String agencyAddress;
  final bool isPremium;
  final String agencyImage;
  final String licenceDate;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppBottomSheet.buildAgencySheet(
            context: context,
            name: agencyName,
            address: agencyAddress,
            license: licenceDate,
            image: agencyImage,
            phone: phone,
            isPremium: isPremium);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
            height: 12.h,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 25.w,
                  height: 25.w,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                    // image: DecorationImage(
                    //   image: AssetImage(AppImages.placeHolderLandscape),
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: '${Api.imageUrl}${agencyImage}',
                      // height: 10.h,
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) => Container(
                        // height: 10.h,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              AppImages.placeHolderLandscape,
                            ),
                            fit: BoxFit.cover,
                          ),
                          color: AppColors.lightGrey,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      placeholder: (context, url) => Align(
                          alignment: Alignment.center,
                          child: AppLoader.imageLoader()),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(top: 3),
                    // width: MediaQuery.of(context).size.width * 0.45,
                    child: RichText(
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '${agencyName}\n',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          TextSpan(
                            text: '''\n${agencyAddress}''',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.primaryColor,
                ),
              ],
            )),
      ),
    );
  }
}
