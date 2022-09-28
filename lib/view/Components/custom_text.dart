
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TitleText extends StatelessWidget {

  final String title;
  const TitleText({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 10),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16.sp,
          color: Color.fromARGB(255, 138, 138, 138),
          fontWeight: FontWeight.bold,
          fontFamily: 'Lato',
        ),
      ),
    );
  }
}
