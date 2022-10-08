import 'package:flutter/material.dart';
import 'package:trifs_app/utils/constants/asset_path.dart';

class GalleryTIle extends StatelessWidget {
  const GalleryTIle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width * 0.25,
      height: MediaQuery.of(
                  context)
              .size
              .height *
          0.10,

      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  AppImages
                      .placeHolderSquare),
              fit: BoxFit
                  .cover),
          color: Colors.amber,
          borderRadius:
              BorderRadius
                  .circular(
                      20)),
      // child: Center(child: Text('$index')),
    );
  }
}