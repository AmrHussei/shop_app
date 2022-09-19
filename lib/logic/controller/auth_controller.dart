import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shop_app/routes/routes.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:shop_app/view/widgets/text_utils.dart';

class AuthController extends GetxController {
  bool isVisability = false;
  bool isCheckBox = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  var displayUserName = '';
  var displayUsephoto = '';

  void visabilityFun() {
    isVisability = !isVisability;
    update();
  }

  void checkBox() {
    isCheckBox = !isCheckBox;
    update();
  }

  void signUpUsingFirebase({
    required String email,
    required String password,
    required String name,
  }) async {
    final String message;
    try {
      await auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        displayUserName = name;

        auth.currentUser!.updateDisplayName(displayUserName);
      });
      Get.offAllNamed(Routes.mainScreen);

      update();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else {
        message = e.code.toString();
      }
      Get.snackbar('Oops !', message,
          backgroundColor: pinkClr,
          borderRadius: 15,
          snackPosition: SnackPosition.TOP);
    } catch (e) {
      Get.snackbar('Error', e.toString(),
          backgroundColor: pinkClr,
          borderRadius: 15,
          snackPosition: SnackPosition.TOP);
    }
  }

  void loginUsingFirebase({
    required String email,
    required String password,
  }) async {
    final String message;
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        displayUserName = auth.currentUser!.displayName!;
      });
      Get.offAllNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      } else {
        message = e.toString();
      }
      Get.snackbar('Oops !', message,
          backgroundColor: pinkClr,
          borderRadius: 15,
          snackPosition: SnackPosition.TOP);
    } catch (e) {
      Get.snackbar('Error', e.toString(),
          backgroundColor: pinkClr,
          borderRadius: 15,
          snackPosition: SnackPosition.TOP);
    }
  }

  void resetPassword(String email) async {
    String message;
    try {
      await auth.sendPasswordResetEmail(email: email);
      Get.offNamed(Routes.logInScreen);
      Get.bottomSheet(Container(
          height: 200,
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            color: mainColor,
          ),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              TextUtils(
                  text: 'Please check your Gmail ',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              SizedBox(
                height: 20,
              ),
              Icon(
                Icons.attach_email_outlined,
                color: Colors.white,
                size: 50,
              )
            ],
          ))));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else {
        message = e.toString();
      }
      Get.snackbar('Oops !', message,
          backgroundColor: pinkClr,
          borderRadius: 15,
          snackPosition: SnackPosition.TOP);
    } catch (e) {
      Get.snackbar('Error', e.toString(),
          backgroundColor: pinkClr,
          borderRadius: 15,
          snackPosition: SnackPosition.TOP);
    }
  }

  void googleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      displayUserName = googleUser!.displayName!;
      if (googleUser.photoUrl != null) {
        displayUsephoto = googleUser.photoUrl!;
      }
      update();
      Get.offAllNamed(Routes.mainScreen);
    } catch (e) {
      Get.snackbar('Error', e.toString(),
          backgroundColor: pinkClr,
          borderRadius: 15,
          snackPosition: SnackPosition.TOP);
    }
  }

  void facebookSignUp() {}

  void signOutFromApp() {}
}
