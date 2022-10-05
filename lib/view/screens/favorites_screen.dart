import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/view/widgets/text_utils.dart';

import '../../logic/controller/product_controller.dart';

class FavorivesScreen extends StatelessWidget {
  FavorivesScreen({super.key});
  final productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Obx(() {
        if (productController.favoriteProductslist.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 150,
                  width: 150,
                  child: Image.asset('images/heart.png'),
                ),
                const SizedBox(
                  height: 30,
                ),
                const TextUtils(
                    text: 'Please enter your favorites productes',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black)
              ],
            ),
          );
        } else {
          return ListView.separated(
            itemBuilder: ((context, index) {
              return buildFavItem(
                image: productController.favoriteProductslist[index].image,
                price: productController.favoriteProductslist[index].price,
                title: productController.favoriteProductslist[index].title,
                idItem: productController.favoriteProductslist[index].id,
              );
            }),
            separatorBuilder: ((context, index) {
              return const Divider(
                thickness: 1,
                color: Colors.grey,
              );
            }),
            itemCount: productController.favoriteProductslist.length,
          );
        }
      }),
    ));
  }

  Widget buildFavItem({
    required String? image,
    required String? title,
    required double? price,
    required int? idItem,
  }) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: Row(
          children: [
            Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.network(
                image!,
                fit: BoxFit.cover,
              ),
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
                    title!,
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
                    '\$$price',
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        overflow: TextOverflow.ellipsis),
                  ),
                ],
              ),
            ),
            IconButton(
                onPressed: () {
                  productController.manageFavoriteItems(idItem!);
                },
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 30,
                ))
          ],
        ),
      ),
    );
  }
}
