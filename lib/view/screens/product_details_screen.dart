import 'package:course_getx/model/product_model.dart';
import 'package:course_getx/view/widget/ProductDetails/image_sliders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/ProductDetails/add_cart.dart';
import '../widget/ProductDetails/clothes_info.dart';
import '../widget/ProductDetails/size_list.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key, required this.productModel})
      : super(key: key);
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageSliders(
                imageUrl: productModel.image,
              ),
              ClothesInfo(
                title: productModel.title,
                productId: productModel.id,
                rate: productModel.rating.rate,
                description: productModel.description,
              ),
              const SizeList(),
              AddCart(
                price: productModel.price,
                productModel: productModel,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
