import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/logic/controller/cart_controller.dart';
import 'package:shop_app/model/product_model.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:shop_app/view/widgets/text_utils.dart';

class Addcart extends StatelessWidget {
  Addcart({super.key, required this.price, required this.productModel});
  final double price;
  final cartController = Get.find<CartController>();
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          Column(
            children: [
              const TextUtils(
                  text: 'Price',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
              const SizedBox(
                height: 5,
              ),
              Text(
                '$price',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              )
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: MaterialButton(
            color: mainColor,
            height: 60,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            onPressed: () {
              cartController.addProductToCart(productModel);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                TextUtils(
                  text: 'Add to cart',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.shopping_cart_checkout_outlined,
                  color: Colors.white,
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
