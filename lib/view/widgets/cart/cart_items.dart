import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/logic/controller/cart_controller.dart';
import 'package:shop_app/model/product_model.dart';
import 'package:shop_app/utils/theme.dart';

class CartItems extends StatelessWidget {
  CartItems({super.key, required this.productModel, required this.index, required this.quantity});
  var cartController = Get.find<CartController>();
 final ProductModel productModel;
 final int index;
 final int quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      height: 120,
      width: MediaQuery.of(context).size.width * 0.6,
      decoration: BoxDecoration(
        color: mainColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Card(
            margin: const EdgeInsets.all(7),
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.network(productModel.image!),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productModel.title!,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      overflow: TextOverflow.ellipsis),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  '\$${cartController.subTotalPrice[index].toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      cartController.removeOneProduct(productModel);
                    },
                    icon: const Icon(Icons.remove_circle),
                  ),
                   Text(
                    '$quantity',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      cartController.addProductToCart(productModel);
                    },
                    icon: const Icon(Icons.add_circle),
                  ),
                ],
              ),
              IconButton(
                  onPressed: () {
                    cartController.deletProduct(productModel);
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
