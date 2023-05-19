import 'package:course_getx/logic/controller/auth_controller.dart';
import 'package:course_getx/logic/controller/setting_controller.dart';
import 'package:course_getx/view/widget/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileWidget extends StatelessWidget {
  ProfileWidget({Key? key}) : super(key: key);
  final authController = Get.find<AuthController>();
  final controller = Get.find<SettingController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() {
          return Row(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image:
                            NetworkImage(authController.displayUserPhoto.value),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextUtils(
                      text: controller
                          .capitalize(authController.displayUserName.value),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      underLine: TextDecoration.none),
                  TextUtils(
                      text: authController.displayUserEmail.value,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      underLine: TextDecoration.none),
                ],
              )
            ],
          );
        })
      ],
    );
  }
}
