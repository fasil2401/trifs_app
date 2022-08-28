import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trifs_app/utils/constants/colors.dart';
import 'package:trifs_app/utils/routes/route_manager.dart';
import 'package:trifs_app/view/Components/login_button.dart';
import 'package:trifs_app/view/Components/login_text_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;
    final double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: h,
            width: w,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: const AssetImage('assets/images/sign up.png'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.8), BlendMode.overlay)),
            ),
          ),
          SizedBox(
            width: w,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Join Us!",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: h * 0.1,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: w * 0.1),
                      child: Column(
                        children: [
                          LoginTextField(
                            hintText: 'Full Name',
                            prefixIcon: Icons.person,
                            isObscureText: false,
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (val) {},
                          ),
                          SizedBox(
                            height: h * 0.02,
                          ),
                          LoginTextField(
                            hintText: 'Mobile Number',
                            prefixIcon: Icons.phone_android_outlined,
                            isObscureText: false,
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (val) {},
                          ),
                          SizedBox(
                            height: h * 0.02,
                          ),
                          LoginTextField(
                            hintText: 'Email Address',
                            prefixIcon: Icons.mail_outline,
                            isObscureText: false,
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (val) {},
                          ),
                          SizedBox(
                            height: h * 0.02,
                          ),
                          LoginTextField(
                            hintText: 'Password',
                            prefixIcon: Icons.lock,
                            isObscureText: true,
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (val) {},
                          ),
                          SizedBox(
                            height: h * 0.02,
                          ),
                          LoginTextField(
                            hintText: 'Confirm Password',
                            prefixIcon: Icons.lock,
                            isObscureText: false,
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (val) {},
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: h * 0.04,
                    ),
                    LoginButton(
                      w: w,
                      h: h,
                      onPressed: () {},
                      text: 'Sign Up',
                      isLoading: false,
                    ),
                    SizedBox(
                      height: h * 0.1,
                    ),
                    EasyRichText(
                      'Don\'t have an account ? Sign In here',
                      defaultStyle: const TextStyle(
                        color: AppColors.white,
                      ),
                      patternList: [
                        EasyRichTextPattern(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.toNamed(AppRoutes.loginScreen);
                            },
                          targetString: 'Sign In',
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
