import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:trifs_app/utils/constants/api_constants.dart';
import 'package:trifs_app/utils/constants/asset_path.dart';
import 'package:trifs_app/utils/constants/colors.dart';
import 'package:trifs_app/view/Components/loader.dart';

class PromotedAgencySlider extends StatelessWidget {
  PromotedAgencySlider({Key? key, required this.agencies}) : super(key: key);

  List<dynamic> agencies = [];

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.18,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: agencies.length,
          // itemCount: 1,
          separatorBuilder: (context, index) => SizedBox(
            width: 4,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Get.to(() => HouseBoatPackageSingle());
                print(agencies[index].logo);
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Container(
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 40,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: CachedNetworkImage(
                            imageUrl: '${Api.imageUrl}${agencies[index].logo}',
                            // height: 10.h,
                            errorWidget: (context, url, error) => Container(
                              // height: 10.h,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    AppImages.placeHolderSquare,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                color: AppColors.lightGrey,
                                borderRadius: BorderRadius.circular(40),
                              ),
                            ),
                            placeholder: (context, url) => Align(
                                alignment: Alignment.center,
                                child: AppLoader.imageLoader()),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: 80,
                        child: Text(
                          agencies[index].name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
