import 'package:get/get.dart';
import 'package:shop_app/logic/bindings/main_binding.dart';
import 'package:shop_app/logic/bindings/product_binding.dart';
import 'package:shop_app/view/screens/cart_screen.dart';
import 'package:shop_app/view/screens/main_screen.dart';
import 'package:shop_app/view/screens/welcome_screen.dart';

import '../logic/bindings/auth_binding.dart';
import '../view/screens/auth/forgot_password_screen.dart';
import '../view/screens/auth/login_screen.dart';
import '../view/screens/auth/signup_screen.dart';
import '../view/screens/payment_screen.dart';

class AppRoutes {
  static const wlcome = Routes.welcomeScreen;
  static const mainScreen = Routes.welcomeScreen;

  static final List<GetPage> routes = [
    GetPage(
      name: Routes.welcomeScreen,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: Routes.signUpScreen,
      page: () => SignUpScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.logInScreen,
      page: () => LogInScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.forgetPassword,
      page: () => ForgetPassword(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.mainScreen,
      page: () => MainScreen(),
      bindings: [AuthBinding(), MainBinding(), ProductBinding()],
    ),
    GetPage(
      name: Routes.cartScreen,
      page: () => CartScreen(),
      bindings: [
        AuthBinding(),
        MainBinding(),
        ProductBinding(),
      ],
    ),
    GetPage(
      name: Routes.paymentScreen,
      page: () => PayMentScreen(),
      bindings: [
        AuthBinding(),
        ProductBinding(),
        MainBinding(),
      ],
    ),
  ];
}

class Routes {
  static const String welcomeScreen = "/welcomescreen";
  static const String logInScreen = "/logInScreen";
  static const String signUpScreen = "/signUpScreen";
  static const String forgetPassword = "/forgetPassword";
  static const String mainScreen = "/mainScreen";
  static const String cartScreen = "/cartScreen";
  static const paymentScreen = '/paymentScreen';
}
