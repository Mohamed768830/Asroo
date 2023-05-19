import 'package:course_getx/logic/controller/setting_controller.dart';
import 'package:course_getx/logic/controller/theme_controller.dart';
import 'package:course_getx/utils/theme.dart';
import 'package:course_getx/view/widget/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DarkModeWidget extends StatelessWidget {
  DarkModeWidget({Key? key}) : super(key: key);
  final controller = Get.find<SettingController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildIconWidget(),
            Switch(
                activeTrackColor: Get.isDarkMode ? pinkClr : mainColor,
                activeColor: Get.isDarkMode ? pinkClr : mainColor,
                value: controller.swithchValue.value,
                onChanged: (value) {
                  ThemeController().changesTheme();
                  controller.swithchValue.value = value;
                })
          ],
        );
      },
    );
  }

  Widget buildIconWidget() {
    return Material(
      color: Colors.transparent,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: darkSettings,
            ),
            child: const Icon(
              Icons.dark_mode,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          TextUtils(
              text: "Dark Mode".tr,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? Colors.white : Colors.black,
              underLine: TextDecoration.none)
        ],
      ),
    );
  }
}
