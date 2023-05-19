import 'package:course_getx/utils/theme.dart';
import 'package:course_getx/view/widget/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthButton extends StatelessWidget {
  AuthButton({Key? key, required this.text, required this.onTap})
      : super(key: key);

  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Get.isDarkMode ? pinkClr : mainColor,
        width: double.infinity,
        height: 50,
        child: Center(
          child: TextUtils(
              text: text,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              underLine: TextDecoration.none),
        ),
      ),
    );
  }
}
