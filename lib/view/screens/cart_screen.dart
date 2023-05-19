import 'package:course_getx/view/widget/Cart/empty_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../logic/controller/cart_controller.dart';
import '../../utils/theme.dart';
import '../widget/Cart/cart_product_card.dart';
import '../widget/Cart/cart_total.dart';

class CartScreen extends StatelessWidget {
  final controller = Get.find<CartController>();

  CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
            title: const Text("Cart Items"),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
            actions: [
              IconButton(
                  onPressed: () {
                    controller.clearAllProducts();
                  },
                  icon: const Icon(Icons.backspace))
            ],
          ),
          body: Obx(
            () {
              if (controller.productsMap.isEmpty) {
                return EmptyCart();
              } else {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 600,
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              return CartProductCard(
                                quantity: controller.productsMap.values
                                    .toList()[index],
                                index: index,
                                productModel:
                                    controller.productsMap.keys.toList()[index],
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  height: 20,
                                ),
                            itemCount: controller.productsMap.length),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 30,
                        ),
                        child: CartTotal(),
                      )
                    ],
                  ),
                );
              }
            },
          )),
    );
  }
}
