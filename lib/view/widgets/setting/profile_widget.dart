import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/logic/controller/auth_controller.dart';
import 'package:shop_app/logic/controller/setting_controller.dart';
import 'package:shop_app/view/widgets/text_utils.dart';

class ProfileWidget extends StatelessWidget {
  ProfileWidget({super.key});
  final settingController = Get.find<SettingController>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Obx((() {
      return Row(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(authController.displayUserPhoto.value),
                  fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtils(
                text: settingController
                    .capitalize(authController.displayUserName.value),
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              TextUtils(
                text: authController.displayUserEmail.value,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ],
          )
        ],
      );
    }));
  }
}
