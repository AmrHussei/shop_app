import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/logic/controller/category_controller.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:shop_app/view/screens/category_items.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({super.key});
  final categoryController = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      (() {
        if (categoryController.isCategoryLoding.value) {
          return const Center(
              child: CircularProgressIndicator(
            color: mainColor,
          ));
        } else {
          return Expanded(
            child: ListView.separated(
              itemBuilder: ((context, index) {
                return InkWell(
                  onTap: () {
                    categoryController.getSpecificCategoryIndex(index);
                    Get.to(
                      CategoryItems(
                          title: categoryController.categoryNameList[index]),
                    );
                  },
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image:
                            NetworkImage(categoryController.imageList[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          categoryController.categoryNameList[index],
                          style: TextStyle(
                            backgroundColor: Colors.grey.withOpacity(0.4),
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
              separatorBuilder: ((context, index) => const SizedBox(
                    height: 15,
                  )),
              itemCount: categoryController.categoryNameList.length,
            ),
          );
        }
      }),
    );
  }
}
