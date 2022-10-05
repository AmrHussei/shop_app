import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/logic/controller/cart_controller.dart';
import 'package:shop_app/logic/controller/product_controller.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:shop_app/view/screens/product_detal_screen.dart';
import 'package:shop_app/view/widgets/text_utils.dart';

import '../../../model/product_model.dart';

class CardItem extends StatelessWidget {
  CardItem({super.key});
  final productController = Get.find<ProductController>();
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (productController.isLoding.value) {
        return const CircularProgressIndicator();
      } else {
        return Expanded(
          child: productController.serchlist.isEmpty &&
                  productController.serchController.text.isNotEmpty
              ? Image.asset('images/search_empry_light.png')
              : GridView.builder(
                  itemCount: productController.serchlist.isEmpty
                      ? productController.productslist.length
                      : productController.serchlist.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      childAspectRatio: 0.8,
                      mainAxisSpacing: 9.0,
                      maxCrossAxisExtent: 200,
                      crossAxisSpacing: 0.6),
                  itemBuilder: ((context, index) {
                    if (productController.serchlist.isEmpty) {
                      return buildCartItem(
                        image: productController.productslist[index].image,
                        price: productController.productslist[index].price,
                        rating:
                            productController.productslist[index].rating!.rate,
                        id: productController.productslist[index].id,
                        productModel: productController.productslist[index],
                        onTap: () {
                          Get.to(ProductDetalScreen(
                            productModel: productController.productslist[index],
                          ));
                        },
                      );
                    } else {
                      return buildCartItem(
                        image: productController.serchlist[index].image,
                        price: productController.serchlist[index].price,
                        rating: productController.serchlist[index].rating!.rate,
                        id: productController.serchlist[index].id,
                        productModel: productController.serchlist[index],
                        onTap: () {
                          Get.to(ProductDetalScreen(
                            productModel: productController.serchlist[index],
                          ));
                        },
                      );
                    }
                  }),
                ),
        );
      }
    });
  }

  Widget buildCartItem(
      {required String? image,
      required double? price,
      required double rating,
      required int? id,
      required ProductModel productModel,
      required Function() onTap}) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(5), boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 0.5,
                spreadRadius: 0.3),
          ]),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    (() {
                      return IconButton(
                          onPressed: () {
                            productController.manageFavoriteItems(id);
                          },
                          icon: productController.isFavItem(id!)
                              ? const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                              : const Icon(Icons.favorite_border_outlined));
                    }),
                  ),
                  IconButton(
                    onPressed: () {
                      cartController.addProductToCart(productModel);
                    },
                    icon: const Icon(Icons.shopping_cart),
                  ),
                ],
              ),
              Builder(builder: (context) {
                return Container(
                  height: MediaQuery.of(context).size.height / 7.1,
                  width: double.infinity,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5)),
                  child: Image.network(
                    image!,
                    fit: BoxFit.fitHeight,
                  ),
                );
              }),
              Padding(
                padding: const EdgeInsets.all(4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextUtils(
                      text: '\$$price',
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                    Builder(builder: (context) {
                      return Container(
                        height: MediaQuery.of(context).size.height / 48,
                        width: 50,
                        decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextUtils(
                              text: '$rating ',
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                            const Icon(
                              size: 15,
                              Icons.star,
                              color: Colors.yellowAccent,
                            )
                          ],
                        ),
                      );
                    })
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
