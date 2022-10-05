import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/routes/routes.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:shop_app/view/widgets/text_utils.dart';

import '../../../logic/controller/cart_controller.dart';

class BottomOfCartScreen extends StatelessWidget {
  BottomOfCartScreen({super.key});
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Builder(builder: (context) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                const TextUtils(
                    text: 'Total',
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 96,
                ),
                Obx((() {
                  return TextUtils(
                      text: '\$${cartController.totalPrice}',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black);
                }))
              ],
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: MaterialButton(
                height: MediaQuery.of(context).size.height * 0.07,
                color: mainColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: (() {
                  Get.toNamed(Routes.paymentScreen);
                }),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    TextUtils(
                        text: 'Check Out',
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}
