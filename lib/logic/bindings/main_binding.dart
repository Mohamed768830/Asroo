import 'package:course_getx/logic/controller/main_controller.dart';
import 'package:course_getx/logic/controller/setting_controller.dart';
import 'package:get/get.dart';

import '../controller/payment_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(SettingController());
    Get.put(PaymentController(), permanent: true);
  }
}
