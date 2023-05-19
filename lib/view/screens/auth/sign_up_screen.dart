import 'package:course_getx/logic/controller/auth_controller.dart';
import 'package:course_getx/routes/routes.dart';
import 'package:course_getx/utils/my_string.dart';
import 'package:course_getx/utils/theme.dart';
import 'package:course_getx/view/screens/auth/check_widget.dart';
import 'package:course_getx/view/widget/conatiner_under.dart';
import 'package:course_getx/view/widget/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/auth_button.dart';
import '../../widget/auth_text_form_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
        elevation: 0,
      ),
      backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 1.3,
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 40),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          TextUtils(
                              text: "Sign",
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              color: Get.isDarkMode ? pinkClr : mainColor,
                              underLine: TextDecoration.none),
                          const SizedBox(
                            width: 3,
                          ),
                          TextUtils(
                              text: "Up",
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                              underLine: TextDecoration.none),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      AuthTextFormField(
                        controller: nameController,
                        obscureText: false,
                        validator: (value) {
                          if (value.toString().length <= 2 ||
                              !RegExp(validationName).hasMatch(value)) {
                            return 'Enter Valid Name';
                          } else {
                            return null;
                          }
                        },
                        prefixIcon: Get.isDarkMode
                            ? Image.asset(
                                'assets/images/user.png',
                              )
                            : Icon(
                                Icons.person,
                                color: Get.isDarkMode ? pinkClr : mainColor,
                                size: 30,
                              ),
                        suffixIcon: const Text(''),
                        hintText: "User Name",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AuthTextFormField(
                        controller: emailController,
                        obscureText: false,
                        validator: (value) {
                          if (!RegExp(validationEmail).hasMatch(value)) {
                            return 'Invalid Email';
                          } else {
                            return null;
                          }
                        },
                        prefixIcon: Get.isDarkMode
                            ? Image.asset(
                                'assets/images/email.png',
                                color: Get.isDarkMode ? mainColor : pinkClr,
                              )
                            : Icon(
                                Icons.email,
                                color: Get.isDarkMode ? pinkClr : mainColor,
                                size: 30,
                              ),
                        suffixIcon: const Text(''),
                        hintText: "Email",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GetBuilder<AuthController>(builder: (_) {
                        return AuthTextFormField(
                          controller: passwordController,
                          obscureText: controller.isVisibilty ? false : true,
                          validator: (value) {
                            if (value.toString().length < 6) {
                              return 'Password should be longer or equal to 6 characters';
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: Get.isDarkMode
                              ? Image.asset('assets/images/lock.png')
                              : Icon(
                                  Icons.lock,
                                  color: Get.isDarkMode ? pinkClr : mainColor,
                                  size: 30,
                                ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              controller.visibility();
                            },
                            icon: controller.isVisibilty
                                ? const Icon(
                                    Icons.visibility_off,
                                    color: Colors.black,
                                  )
                                : const Icon(
                                    Icons.visibility,
                                    color: Colors.black,
                                  ),
                          ),
                          hintText: "Password",
                        );
                      }),
                      const SizedBox(
                        height: 50,
                      ),
                      CheckWidget(),
                      const SizedBox(
                        height: 50,
                      ),
                      GetBuilder<AuthController>(
                        builder: (_) {
                          return AuthButton(
                            text: 'Sign Up',
                            onTap: () {
                              if (controller.isCheckBox == false) {
                                Get.snackbar('Check Box',
                                    "Please Accept terms & conditions",
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: Colors.green,
                                    colorText: Colors.white);
                              } else if (formKey.currentState!.validate()) {
                                String name = nameController.text.trim();
                                String email = emailController.text.trim();
                                String password = passwordController.text;
                                controller.signUpUsingFirebase(
                                    name: name,
                                    email: email,
                                    password: password);
                                controller.isCheckBox = true;
                              }
                            },
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
            ContainerUnder(
              text: 'Already have an Account?',
              textType: 'Log in',
              onPressed: () {
                Get.offNamed(Routes.loginScreen);
              },
            )
          ],
        ),
      ),
    ));
  }
}
