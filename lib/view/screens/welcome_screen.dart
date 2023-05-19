import 'package:course_getx/utils/theme.dart';
import 'package:course_getx/view/screens/auth/login_screen.dart';
import 'package:course_getx/view/widget/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../routes/routes.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                'assets/images/background.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.2),
              width: double.infinity,
              height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Container(
                      height: 60,
                      width: 190,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                          child: TextUtils(
                            underLine: TextDecoration.none,
                            text: "Welcome",
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        height: 60,
                        width: 230,
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextUtils(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              text: "Asroo",
                              underLine: TextDecoration.none,
                              color: mainColor,
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            TextUtils(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              text: "Shop",
                              underLine: TextDecoration.none,
                              color: Colors.white,
                            ),
                          ],
                        )),
                    const SizedBox(
                      height: 250,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: mainColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 12),
                        ),
                        onPressed: () {
                          Get.offNamed(Routes.loginScreen);
                        },
                        child: TextUtils(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          text: "Get Start",
                          underLine: TextDecoration.none,
                        )),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextUtils(
                            text: "Don't have Account?",
                            underLine: TextDecoration.none,
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                        TextButton(
                            onPressed: () {
                              Get.offNamed(Routes.signUpScreen);
                            },
                            child: TextUtils(
                              text: "Sign Up",
                              color: Colors.white,
                              underLine: TextDecoration.underline,
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ))
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
