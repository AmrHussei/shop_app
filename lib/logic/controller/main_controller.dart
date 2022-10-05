import 'package:get/get.dart';
import 'package:shop_app/view/screens/category_screen.dart';
import 'package:shop_app/view/screens/favorites_screen.dart';
import 'package:shop_app/view/screens/home_screen.dart';
import 'package:shop_app/view/screens/settings_screen.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  final tabs = [
    const HomeScreen(),
    const CatecoryScreen(),
    FavorivesScreen(),
    const SettingsScreen(),
  ].obs;

  final title = ['Home', 'category', 'Favorite', 'Settings'].obs;
}
