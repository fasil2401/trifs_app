import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:trifs_app/utils/constants/colors.dart';
import 'package:trifs_app/view/Components/login_button.dart';
import 'package:trifs_app/view/Components/login_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
                  image: const AssetImage('assets/images/login.jpg'),
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
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.asset(
                        'assets/images/trifs_logo_login.png',
                      ),
                    ),
                    SizedBox(
                      height: h * 0.01,
                    ),
                    const Text(
                      "Welcome Back!",
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
                            hintText: 'Email or Mobile Number',
                            prefixIcon: Icons.person,
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
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Forgot Password ?',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    LoginButton(
                      w: w,
                      h: h,
                      onPressed: () {},
                      text: 'Sign In',
                      isLoading: false,
                    ),
                    SizedBox(
                      height: h * 0.04,
                    ),
                    EasyRichText(
                      'Don\'t have an account ? Sign Up here',
                      defaultStyle: const TextStyle(
                        color: AppColors.white,
                      ),
                      patternList: [
                        EasyRichTextPattern(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print('Recognized');
                            },
                          targetString: 'Sign Up',
                          style:const TextStyle(fontWeight: FontWeight.w700),
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
