import 'package:course_getx/logic/controller/auth_controller.dart';
import 'package:course_getx/view/widget/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controller/payment_controller.dart';
import '../../../routes/routes.dart';
import '../../../utils/theme.dart';

class DeliveryContainerWidget extends StatefulWidget {
  const DeliveryContainerWidget({Key? key}) : super(key: key);

  @override
  State<DeliveryContainerWidget> createState() =>
      _DeliveryContainerWidgetState();
}

class _DeliveryContainerWidgetState extends State<DeliveryContainerWidget> {
  int radioContainerIndex = 1;
  bool changeColors = false;
  final TextEditingController phoneController = TextEditingController();
  final controller = Get.find<PaymentController>();
  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildRadioContainer(
            icon: Container(),
            address: "Egypt,El Mansoura,Mit Ghamr",
            name: "Mohammed",
            phone: "51-887-9932",
            color: changeColors ? Colors.white : Colors.grey.shade300,
            title: "ASROO SHOP",
            value: 1,
            onChanged: (int? value) {
              setState(() {
                radioContainerIndex = value!;
                changeColors = !changeColors;
              });
            }),
        const SizedBox(
          height: 10,
        ),
        Obx(() {
          return buildRadioContainer(
              icon: InkWell(
                onTap: () {
                  Get.defaultDialog(
                      title: "Enter your phone number",
                      titleStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      backgroundColor: Colors.white,
                      radius: 10,
                      textCancel: "Cancel",
                      confirmTextColor: Colors.black,
                      textConfirm: "Save",
                      cancelTextColor: Colors.black,
                      onCancel: () {
                        Get.toNamed(Routes.paymentScreen);
                      },
                      onConfirm: () {
                        Get.back();
                        controller.phoneNumber.value = phoneController.text;
                      },
                      buttonColor: Get.isDarkMode ? pinkClr : mainColor,
                      content: Padding(
                        padding: const EdgeInsets.all(15),
                        child: TextField(
                          controller: phoneController,
                          cursorColor: Colors.black,
                          maxLength: 11,
                          keyboardType: TextInputType.text,
                          onSubmitted: (value) {
                            phoneController.text = value;
                          },
                          decoration: InputDecoration(
                            fillColor: Get.isDarkMode
                                ? pinkClr.withOpacity(0.1)
                                : mainColor.withOpacity(0.2),
                            focusColor: Colors.red,
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Get.isDarkMode ? pinkClr : mainColor,
                            ),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  phoneController.clear();
                                },
                                icon: const Icon(
                                  Icons.close,
                                  color: Colors.black,
                                )),
                            hintText: "Enter Your Phone Number",
                            hintStyle: const TextStyle(
                              color: Colors.black45,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ));
                },
                child: Icon(
                  Icons.contact_phone,
                  size: 20,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                ),
              ),
              address: controller.address.value,
              name: authController.displayUserName.value,
              phone: controller.phoneNumber.value,
              color: changeColors ? Colors.grey.shade300 : Colors.white,
              title: "Delivery",
              value: 2,
              onChanged: (int? value) {
                setState(() {
                  radioContainerIndex = value!;
                  changeColors = !changeColors;
                });
                controller.updatePosition();
              });
        })
      ],
    );
  }

  Widget buildRadioContainer({
    required Color color,
    required int value,
    required Function onChanged,
    required String name,
    required String title,
    required String phone,
    required String address,
    required Widget icon,
  }) {
    return Container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 5,
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Radio(
              value: value,
              fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
              groupValue: radioContainerIndex,
              onChanged: (int? value) {
                onChanged(value);
              }),
          const SizedBox(
            width: 10,
          ),
          Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextUtils(
                      text: title,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      underLine: TextDecoration.none),
                  const SizedBox(
                    height: 5,
                  ),
                  TextUtils(
                      text: name,
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      underLine: TextDecoration.none),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Text("🇪🇬+02 "),
                      TextUtils(
                          text: phone,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          underLine: TextDecoration.none),
                      const SizedBox(
                        width: 120,
                      ),
                      SizedBox(
                        child: icon,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextUtils(
                      text: address,
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      underLine: TextDecoration.none),
                ],
              ))
        ],
      ),
    );
  }
}
