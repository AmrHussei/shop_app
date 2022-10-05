import 'package:get/get.dart';
import 'package:shop_app/logic/controller/main_controller.dart';
import 'package:shop_app/logic/controller/payment_controller.dart';
import 'package:shop_app/logic/controller/setting_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(SettingController());
    Get.put(PayMentController(),permanent: true);
  }
}
