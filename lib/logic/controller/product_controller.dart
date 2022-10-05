import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../model/product_model.dart';
import '../../services/product_services.dart';

class ProductController extends GetxController {
  RxList<ProductModel> productslist = <ProductModel>[].obs;
  RxList<ProductModel> serchlist = <ProductModel>[].obs;
  RxList<ProductModel> favoriteProductslist = <ProductModel>[].obs;
  var isLoding = true.obs;
  RxBool isFav = false.obs;
  var getStorage = GetStorage();
  final TextEditingController serchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    List? storedList = getStorage.read<List>('FavList');
    if (storedList != null) {
      favoriteProductslist = storedList
          .map((element) => ProductModel.fromJson(element))
          .toList()
          .obs;
    }
    getProducts();
  }

  void getProducts() async {
    var product = await ProductServices.getProduct();

    try {
      isLoding(true);
      if (product.isNotEmpty) {
        productslist.addAll(product);
      }
      print('product has succes=========================');
    } finally {
      isLoding(false);
    }
  }

  void manageFavoriteItems(int idItem) {
    var index =
        favoriteProductslist.indexWhere((element) => element.id == idItem);
    if (index >= 0) {
      favoriteProductslist.removeAt(index);
      getStorage.remove('FavList');
    } else {
      favoriteProductslist
          .add(productslist.firstWhere((element) => element.id == idItem));
      getStorage.write('FavList', favoriteProductslist);
    }
  }

  bool isFavItem(int idItem) {
    return favoriteProductslist.any((element) => element.id == idItem);
  }

  void addSerchItemToList(String serchName) {
    serchlist.value = productslist.where((serch) {
      var serchTitle = serch.title!.toLowerCase();
      var serchPrice = serch.title!.toLowerCase();
      return serchTitle.contains(serchName.toLowerCase()) ||
          serchPrice.toString().contains(serchName.toLowerCase());
    }).toList();
    update();
  }

  void clearSerch() {
    serchController.clear();
    addSerchItemToList('');
  }
}
