import 'package:flutter/material.dart';
import 'package:trifs_app/utils/constants/colors.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
    required this.w,
    required this.h,
    required this.onPressed,
    required this.text,
    required this.isLoading,
  }) : super(key: key);

  final double w;
  final double h;
  final String text;
  final bool isLoading;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: w * 0.1),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: h * 0.02),
          child: isLoading
              ? SizedBox(
                  width: w * 0.06,
                  height: w * 0.06,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    valueColor: AlwaysStoppedAnimation(
                      AppColors.white,
                    ),
                  ),
                )
              : Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
        ),
      ),
    );
  }
}
