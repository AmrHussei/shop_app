import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/logic/controller/auth_controller.dart';
import 'package:shop_app/view/widgets/text_utils.dart';

import '../../../utils/theme.dart';

class CheckBoxWidget extends StatelessWidget {
  CheckBoxWidget({super.key});
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GetBuilder<AuthController>(builder: (_) {
          return InkWell(
            onTap: () {
              authController.checkBox();
            },
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              child: authController.isCheckBox
                  ? Image.asset('images/check.png')
                  : Container(),
            ),
          );
        }),
        const SizedBox(
          width: 7,
        ),
        const TextUtils(
          text: 'I accept ',
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        InkWell(
          onTap: (() {}),
          child: const TextUtils(
            text: ' terms & conditions',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: logOutSettings,
          ),
        )
      ],
    );
  }
}
