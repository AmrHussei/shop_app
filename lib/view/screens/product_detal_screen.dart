import 'package:flutter/material.dart';
import 'package:shop_app/model/product_model.dart';

import '../widgets/product_detal/add_cart.dart';
import '../widgets/product_detal/image_slider.dart';
import '../widgets/product_detal/product_info_rate.dart';
import '../widgets/product_detal/sized_list.dart';

class ProductDetalScreen extends StatelessWidget {
  const ProductDetalScreen({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: CustomScrollView(slivers: [
        SliverFillRemaining(
          hasScrollBody: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ImageSlider(imageUrl: productModel.image!),
              ProductInfoRate(
                title: productModel.title!,
                idItem: productModel.id!,
                rate: productModel.rating!.rate,
                descriptions: productModel.description!,
              ),
              const SizedList(),
              Expanded(child: Container()),
              Addcart(price: productModel.price!, productModel: productModel),
            ],
          ),
        ),
      ]),
    ));
  }
}
