import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/logic/controller/auth_controller.dart';
import 'package:shop_app/routes/routes.dart';
import 'package:shop_app/utils/my_string.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:shop_app/view/widgets/auth/auth_text_form_filed.dart';
import 'package:shop_app/view/widgets/auth/check_box_widget.dart';

import 'package:shop_app/view/widgets/text_utils.dart';

import '../../widgets/auth/auth_button.dart';
import '../../widgets/auth/container_under.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final TextEditingController nameController = TextEditingController();
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
                            text: 'SIGN',
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            color: mainColor,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          TextUtils(
                            text: 'UP',
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 19.2,
                      ),
                      AuthTextFormFiled(
                        controller: nameController,
                        obscureText: false,
                        textInputType: TextInputType.name,
                        validator: (value) {
                          if (value.toString().length <= 2 ||
                              !RegExp(validationName).hasMatch(value)) {
                            return 'Enter valid name';
                          } else {
                            return null;
                          }
                        },
                        prefixIcon: const Icon(
                          Icons.person,
                          color: mainColor,
                          size: 28,
                        ),
                        suffixIcon: const Text(''),
                        hintText: 'User Name',
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 48,
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
                          size: 28,
                        ),
                        suffixIcon: const Text(''),
                        hintText: 'Email',
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 48,
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
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 19.2,
                      ),
                      CheckBoxWidget(),
                      SizedBox(height: MediaQuery.of(context).size.height / 7),
                      GetBuilder<AuthController>(
                        builder: (_) {
                          return AuthButton(
                            onPressed: () {
                              if (authController.isCheckBox == false) {
                                Get.snackbar('Sorry',
                                    '...please accept our terms & conditions',
                                    backgroundColor: pinkClr,
                                    borderRadius: 15,
                                    snackPosition: SnackPosition.TOP);
                              } else if (formKey.currentState!.validate()) {
                                String email = emailController.text;
                                String password = emailController.text.trim();
                                String name = emailController.text.trim();
                                authController.signUpUsingFirebase(
                                    email: email,
                                    password: password,
                                    name: name);
                              }
                            },
                            text: 'Sign Up',
                          );
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 19.2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ContainerUnder(
                onPressed: () {
                  Get.toNamed(Routes.logInScreen);
                },
                text: 'Already have an account ?',
                text2: 'Log in'),
          ],
        ),
      ),
    ));
  }
}
