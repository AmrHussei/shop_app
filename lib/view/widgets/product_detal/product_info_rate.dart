import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:shop_app/logic/controller/product_controller.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:shop_app/view/widgets/text_utils.dart';

class ProductInfoRate extends StatelessWidget {
  ProductInfoRate(
      {super.key,
      required this.title,
      required this.idItem,
      required this.rate,
      required this.descriptions});
  final String title;
  final String descriptions;
  final int idItem;
  final double rate;
  final productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.black),
                ),
              ),
              Obx(
                (() {
                  return InkWell(
                    onTap: (() {
                      productController.manageFavoriteItems(idItem);
                    }),
                    child: Container(
                        padding: const EdgeInsets.all(8),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.withOpacity(0.4),
                        ),
                        child: Icon(
                          Icons.favorite,
                          color: productController.isFavItem(idItem)
                              ? Colors.red
                              : Colors.black.withOpacity(0.7),
                        )),
                  );
                }),
              )
            ],
          ),
          Row(
            children: [
              TextUtils(
                  text: '$rate',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              const SizedBox(
                width: 8,
              ),
              RatingBar.builder(
                itemSize: 25,
                initialRating: rate,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 1),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ReadMoreText(
            style: const TextStyle(fontSize: 16, height: 1.7),
            textAlign: TextAlign.start,
            descriptions,
            trimLines: 3,
            colorClickableText: Colors.pink,
            trimCollapsedText: 'Show more',
            trimExpandedText: 'Show less',
            trimMode: TrimMode.Line,
            moreStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: mainColor,
            ),
            lessStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: mainColor,
            ),
          ),
        ],
      ),
    );
  }
}
