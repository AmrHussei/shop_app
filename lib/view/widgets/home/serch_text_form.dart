import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/logic/controller/product_controller.dart';
import 'package:shop_app/utils/theme.dart';

class SerchFormFiled extends StatelessWidget {
  SerchFormFiled({
    super.key,
    required this.textInputType,
    required this.prefixIcon,
    required this.hintText,
  });

  final TextInputType textInputType;
  final Widget prefixIcon;

  final String hintText;
  final productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      builder: ((_) => TextField(
            controller: productController.serchController,
            onChanged: ((serchName) {
              productController.addSerchItemToList(serchName);
            }),
            cursorColor: Colors.black,
            keyboardType: textInputType,
            decoration: InputDecoration(
              fillColor: Colors.grey.shade200,
              filled: true,
              prefixIcon: prefixIcon,
              suffixIcon: productController.serchController.text.isEmpty
                  ? null
                  : IconButton(
                      onPressed: (() {
                        productController.clearSerch();
                      }),
                      icon: const Icon(
                        Icons.close,
                        color: Colors.black45,
                      ),
                    ),
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Colors.black45,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.white),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: pinkClr),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: mainColor),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.white),
              ),
            ),
          )),
    );
  }
}
