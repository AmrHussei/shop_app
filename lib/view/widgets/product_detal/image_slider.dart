import 'dart:ui';

import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/routes/routes.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:shop_app/view/widgets/product_detal/color_picker.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../logic/controller/cart_controller.dart';

class ImageSlider extends StatefulWidget {
  ImageSlider({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int activeimage = 0;
  int currentColor = 0;
  List colorsList = [
    kCOlor1,
    kCOlor2,
    kCOlor3,
    kCOlor4,
    kCOlor5,
  ];
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
            itemCount: 3,
            options: CarouselOptions(
                onPageChanged: (index, reason) {
                  setState(() {
                    activeimage = index;
                  });
                },
                autoPlay: true,
                autoPlayAnimationDuration: const Duration(seconds: 1),
                height: 400,
                enlargeCenterPage: true),
            itemBuilder: ((context, index, realIndex) {
              return Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image:
                        DecorationImage(image: NetworkImage(widget.imageUrl))),
              );
            })),
        Positioned(
          bottom: 10,
          left: MediaQuery.of(context).size.width * 0.5,
          child: AnimatedSmoothIndicator(
            activeIndex: activeimage,
            count: 3,
            effect: const ExpandingDotsEffect(
                dotHeight: 10, dotWidth: 10, activeDotColor: mainColor),
          ),
        ),
        Positioned(
            bottom: 10,
            left: MediaQuery.of(context).size.width * 0.9,
            child: Container(
              height: 200,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: ((context, index) {
                    return InkWell(
                        onTap: () {
                          setState(() {
                            currentColor = index;
                          });
                        },
                        child: ColorPicker(
                            outerBorder: currentColor == index,
                            color: colorsList[index]));
                  }),
                  separatorBuilder: ((context, index) => const SizedBox(
                        height: 3,
                      )),
                  itemCount: colorsList.length),
            )),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: mainColor.withOpacity(0.8),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.cartScreen);
                },
                child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: mainColor.withOpacity(0.8),
                    ),
                    child: Obx((() {
                      return Badge(
                        position: BadgePosition.topEnd(top: -10, end: -9),
                        animationDuration: const Duration(milliseconds: 300),
                        animationType: BadgeAnimationType.slide,
                        badgeContent: Text(
                          cartController.quantity().toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                        child: const Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                          size: 30,
                        ),
                      );
                    }))),
              )
            ],
          ),
        )
      ],
    );
  }
}
