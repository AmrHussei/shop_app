import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/logic/controller/cart_controller.dart';
import 'package:shop_app/logic/controller/main_controller.dart';
import 'package:shop_app/routes/routes.dart';
import 'package:shop_app/utils/theme.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  final mainController = Get.find<MainController>();
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Obx(
      () {
        return Scaffold(
          appBar: AppBar(
            leading: const Text(''),
            title:
                Text(mainController.title[mainController.currentIndex.value]),
            centerTitle: true,
            backgroundColor: mainColor,
            elevation: 0,
            actions: [
              Obx(
                (() {
                  return Badge(
                    position: BadgePosition.topEnd(top: 0, end: 3),
                    animationDuration: const Duration(milliseconds: 300),
                    animationType: BadgeAnimationType.slide,
                    badgeContent: Text(
                      cartController.quantity().toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Get.toNamed(Routes.cartScreen);
                      },
                      icon: Image.asset('images/shop.png'),
                    ),
                  );
                }),
              )
            ],
          ),
          backgroundColor: Colors.white,
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            elevation: 2,
            type: BottomNavigationBarType.fixed,
            currentIndex: mainController.currentIndex.value,
            items: const [
              BottomNavigationBarItem(
                label: '',
                icon: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                activeIcon: Icon(
                  Icons.home,
                  color: mainColor,
                ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Icon(
                  Icons.category,
                  color: Colors.black,
                ),
                activeIcon: Icon(
                  Icons.category,
                  color: mainColor,
                ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Icon(
                  Icons.favorite,
                  color: Colors.black,
                ),
                activeIcon: Icon(
                  Icons.favorite,
                  color: mainColor,
                ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
                activeIcon: Icon(
                  Icons.settings,
                  color: mainColor,
                ),
              ),
            ],
            onTap: (index) {
              mainController.currentIndex.value = index;
            },
          ),
          body: IndexedStack(
              index: mainController.currentIndex.value,
              children: mainController.tabs),
        );
      },
    ));
  }
}
