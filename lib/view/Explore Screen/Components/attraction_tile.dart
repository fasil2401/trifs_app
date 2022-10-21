import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:trifs_app/utils/constants/api_constants.dart';
import 'package:trifs_app/utils/constants/asset_path.dart';
import 'package:trifs_app/utils/constants/colors.dart';

class AttractionTile extends StatelessWidget {
  const AttractionTile({
    required this.imageUrl,
    required this.title,
    Key? key,
  }) : super(key: key);

  final String imageUrl;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
          imageUrl: '${Api.imageUrl}${imageUrl}',
          height: MediaQuery.of(context).size.width * 0.25,
          errorWidget: (context, url, error) => Container(
            height: MediaQuery.of(context).size.width * 0.25,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  AppImages.placeHolderSquare,
                ),
                fit: BoxFit.cover,
              ),
              color: Colors.amber,
              borderRadius: BorderRadius.circular(20),
            ),
            // child: Center(child: Text('$index')),
          ),
          placeholder: (context, url) => Align(
            alignment: Alignment.center,
            child: GFLoader(
              type: GFLoaderType.circle,
              loaderColorOne: AppColors.primaryColor,
              loaderColorTwo: AppColors.primaryColor,
              loaderColorThree: AppColors.primaryColor,
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
