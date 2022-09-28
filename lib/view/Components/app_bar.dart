import 'package:flutter/material.dart';
import 'package:trifs_app/utils/constants/colors.dart';

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
          onPressed: () {},
          icon: Icon(Icons.search),
        ),
        Visibility(
          visible: isLocation,
          child: IconButton(
            splashColor: AppColors.primaryColor.withOpacity(0.5),
            splashRadius: 20,
            onPressed: () {},
            icon: Icon(Icons.location_on_outlined),
          ),
        ),
      ],
    );
  }
}
