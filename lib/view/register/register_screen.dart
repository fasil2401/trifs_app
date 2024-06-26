import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trifs_app/controller/Api%20Controls/register_controller.dart';
import 'package:trifs_app/utils/constants/asset_path.dart';
import 'package:trifs_app/utils/constants/colors.dart';
import 'package:trifs_app/utils/routes/route_manager.dart';
import 'package:trifs_app/view/Components/login_button.dart';
import 'package:trifs_app/view/Components/login_text_field.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final registerController = Get.put(RegisterController());

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
                  image: const AssetImage(AppImages.registerBackground),
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
                            keyboardType: TextInputType.name,
                            onChanged: (val) {
                              registerController.getName(val);
                            },
                          ),
                          SizedBox(
                            height: h * 0.02,
                          ),
                          LoginTextField(
                            hintText: 'Mobile Number',
                            prefixIcon: Icons.phone_android_outlined,
                            isObscureText: false,
                            keyboardType: TextInputType.phone,
                            onChanged: (val) {
                              registerController.getMobileNumber(val);
                            },
                          ),
                          Obx(
                            () => Visibility(
                              visible: registerController.mobileWarning.value,
                              child: const Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'Mobile Number must be 10 digits',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: h * 0.02,
                          ),
                          LoginTextField(
                            hintText: 'Email Address',
                            prefixIcon: Icons.mail_outline,
                            isObscureText: false,
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (val) {
                              registerController.getEmail(val);
                            },
                          ),
                          Obx(
                            () => Visibility(
                              visible: registerController.emailWarning.value,
                              child: const Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'Please enter a valid email address',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: h * 0.02,
                          ),
                          LoginTextField(
                            hintText: 'Password',
                            prefixIcon: Icons.lock,
                            isObscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            onChanged: (val) {
                              registerController.getPassword(val);
                            },
                          ),
                          SizedBox(
                            height: h * 0.02,
                          ),
                          LoginTextField(
                            hintText: 'Pincode',
                            prefixIcon: Icons.lock,
                            isObscureText: false,
                            keyboardType: TextInputType.visiblePassword,
                            onChanged: (val) {
                              registerController.getPincode(val);
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: h * 0.04,
                    ),
                    Obx(
                      () => LoginButton(
                        w: w,
                        h: h,
                        onPressed: () {
                          registerController.getRegister();
                        },
                        text: 'Sign Up',
                        isLoading: registerController.isLoading.value,
                      ),
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
