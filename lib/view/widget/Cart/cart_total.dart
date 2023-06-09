import 'package:course_getx/utils/theme.dart';
import 'package:course_getx/view/widget/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controller/cart_controller.dart';
import '../../../routes/routes.dart';

class CartTotal extends StatelessWidget {
  CartTotal({super.key});

  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        padding: const EdgeInsets.all(25),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtils(
                    text: "Total",
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    underLine: TextDecoration.none),
                Text(
                  "\$${controller.total}",
                  style: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      height: 1.5),
                )
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: SizedBox(
                  height: 60,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 0,
                          primary: Get.isDarkMode ? pinkClr : mainColor),
                      onPressed: () {
                        Get.toNamed(Routes.paymentScreen);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Check Out",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.shopping_cart)
                        ],
                      ))),
            )
          ],
        ),
      );
    });
  }
}
