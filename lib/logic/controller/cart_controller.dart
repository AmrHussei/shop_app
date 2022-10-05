import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/model/product_model.dart';

import '../../utils/theme.dart';

class CartController extends GetxController {
  var cartMap = {}.obs;

  void addProductToCart(ProductModel productModel) {
    if (cartMap.containsKey(productModel)) {
      cartMap[productModel] += 1;
    } else {
      cartMap[productModel] = 1;
    }
  }

  void removeOneProduct(ProductModel productModel) {
    if (cartMap.containsKey(productModel) && cartMap[productModel] == 1) {
      cartMap.removeWhere((key, value) => key == productModel);
    } else {
      cartMap[productModel] -= 1;
    }
  }

  void deletProduct(ProductModel productModel) {
    cartMap.removeWhere((key, value) => key == productModel);
  }

  void clearAllProduct() {
    Get.defaultDialog(
      backgroundColor: Colors.grey,
      title: 'Delet all cart',
      middleText: 'Are you sure you want Delet all cart productes',
      barrierDismissible: false,
      buttonColor: Colors.white,
      textCancel: 'No',
      cancelTextColor: Colors.white,
      textConfirm: 'Yes',
      confirmTextColor: pinkClr,
      onCancel: () {
        Get.back();
      },
      onConfirm: () {
        cartMap.clear();
        Get.back();
      },
    );
  }

  int quantity() {
    if (cartMap.isEmpty) {
      return 0;
    } else {
      return cartMap.entries
          .map((e) => e.value)
          .toList()
          .reduce((value, element) => value + element);
    }
  }

  get subTotalPrice =>
      cartMap.entries.map((e) => e.key.price * e.value).toList();

  get totalPrice => cartMap.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);
}
