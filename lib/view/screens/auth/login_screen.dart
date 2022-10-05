import 'package:flutter/material.dart';
import '../../widgets/auth/auth_button.dart';
import 'package:get/get.dart';
import 'package:shop_app/logic/controller/auth_controller.dart';
import 'package:shop_app/routes/routes.dart';
import 'package:shop_app/utils/my_string.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:shop_app/view/widgets/auth/auth_text_form_filed.dart';
import 'package:shop_app/view/widgets/text_utils.dart';
import '../../widgets/auth/container_under.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 1.3,
              child: Padding(
                padding: const EdgeInsets.only(top: 40, right: 25, left: 25),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          TextUtils(
                            text: 'LOG',
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            color: mainColor,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          TextUtils(
                            text: 'IN',
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 19,
                      ),
                      AuthTextFormFiled(
                        controller: emailController,
                        obscureText: false,
                        textInputType: TextInputType.emailAddress,
                        validator: (value) {
                          if (!RegExp(validationEmail).hasMatch(value)) {
                            return 'Enter valid email';
                          }
                        },
                        prefixIcon: const Icon(
                          Icons.email,
                          color: mainColor,
                          size: 27,
                        ),
                        suffixIcon: const Text(''),
                        hintText: 'Email',
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 50,
                      ),
                      GetBuilder<AuthController>(builder: (_) {
                        return AuthTextFormFiled(
                          controller: passwordController,
                          obscureText: authController.isVisability,
                          textInputType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value.toString().length < 6) {
                              return 'The password must be at least 6 characters long';
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: const Icon(
                            Icons.lock,
                            size: 30,
                            color: mainColor,
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                authController.visabilityFun();
                              },
                              icon: authController.isVisability
                                  ? const Icon(
                                      Icons.visibility,
                                      color: Colors.grey,
                                    )
                                  : const Icon(
                                      Icons.visibility_off,
                                      color: Colors.grey,
                                    )),
                          hintText: 'Password',
                        );
                      }),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Get.toNamed(Routes.forgetPassword);
                          },
                          child: const Text(
                            'Forget password ?',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 19.2,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height / 6.5),
                      GetBuilder<AuthController>(builder: (_) {
                        return AuthButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              String email = emailController.text;
                              String password = emailController.text.trim();
                              authController.loginUsingFirebase(
                                email: email,
                                password: password,
                              );
                            }
                          },
                          text: 'LOG IN',
                        );
                      }),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 30,
                      ),
                      const TextUtils(
                        text: 'OR',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 48,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GetBuilder<AuthController>(builder: (_) {
                            return InkWell(
                              onTap: () {
                                authController.googleSinUpApp();
                              },
                              child: Image.asset('images/google.png'),
                            );
                          }),
                          /* const SizedBox(
                            width: 15,
                          ),
                          InkWell(
                              onTap: () {},
                              child: Image.asset('images/facebook.png')),*/
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            ContainerUnder(
                onPressed: () {
                  Get.toNamed(Routes.signUpScreen);
                },
                text: "Don't have an account ",
                text2: 'sign up'),
          ],
        ),
      ),
    ));
  }
}
