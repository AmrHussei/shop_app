import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/logic/controller/auth_controller.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:shop_app/view/widgets/text_utils.dart';

import '../widgets/setting/language_widget.dart';
import '../widgets/setting/log_out_widget.dart';
import '../widgets/setting/profile_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ProfileWidget(),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            color: Colors.grey,
          ),
          const SizedBox(
            height: 20,
          ),
          const TextUtils(
            text: 'GENERAL',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: mainColor,
          ),
          const SizedBox(
            height: 20,
          ),
          LogOutWidget(),
          const SizedBox(
            height: 20,
          ),
          LanguageWidget(),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
