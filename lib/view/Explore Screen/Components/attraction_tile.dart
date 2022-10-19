import 'package:flutter/material.dart';
import 'package:trifs_app/utils/constants/asset_path.dart';

class AttractionTile extends StatelessWidget {
  const AttractionTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // width: MediaQuery.of(context).size.width * 0.25,
          height: MediaQuery.of(context).size.height * 0.14,

          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppImages.placeHolderSquare),
                  fit: BoxFit.cover),
              color: Colors.amber,
              borderRadius: BorderRadius.circular(20)),
          // child: Center(child: Text('$index')),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          'Attraction Name',
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
