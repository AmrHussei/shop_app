import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/logic/controller/auth_controller.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:shop_app/view/screens/settings_screen.dart';
import 'package:shop_app/view/widgets/text_utils.dart';

class LogOutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: ((controller) {
        return Padding(
          padding: const EdgeInsets.only(left: 20),
          child: InkWell(
            splashColor: Colors.red[200],
            borderRadius: BorderRadius.circular(20),
            onTap: (() {
              Get.defaultDialog(
                backgroundColor: Colors.grey,
                title: 'Log out from the app',
                middleText: 'Are you sure you want to log out from asroo shop',
                barrierDismissible: false,
                buttonColor: Colors.white,
                textCancel: 'No',
                cancelTextColor: Colors.white,
                textConfirm: 'Yes',
                confirmTextColor: pinkClr,
                onCancel: () {
                  Get.back();
                  Get.to(const SettingsScreen());
                },
                onConfirm: () {
                  controller.logOutFromApp();
                },
              );
            }),
            child: Row(
              children: const [
                Icon(
                  Icons.logout,
                  color: Colors.red,
                  size: 30,
                ),
                SizedBox(
                  width: 20,
                ),
                TextUtils(
                  text: 'Logout',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
