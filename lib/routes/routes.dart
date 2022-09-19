import 'package:get/get.dart';
import 'package:shop_app/view/screens/main_screen.dart';
import 'package:shop_app/view/screens/welcome_screen.dart';

import '../logic/bindings/auth_binding.dart';
import '../view/screens/auth/forgot_password_screen.dart';
import '../view/screens/auth/login_screen.dart';
import '../view/screens/auth/signup_screen.dart';

class AppRoutes {
  // intialRoutes
  static const String intialRoutes = Routes.welcomeScreen;

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
      page: () => const MainScreen(),
      binding: AuthBinding(),
    ),
  ];
}

class Routes {
  static const String welcomeScreen = "/welcomescreen";
  static const String logInScreen = "/logInScreen";
  static const String signUpScreen = "/signUpScreen";
  static const String forgetPassword = "/forgetPassword";
  static const String mainScreen = "/mainScreen";
}
