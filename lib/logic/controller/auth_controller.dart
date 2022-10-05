import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shop_app/routes/routes.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:shop_app/view/widgets/text_utils.dart';

class AuthController extends GetxController {
  bool isVisability = false;
  bool isCheckBox = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  var displayUserName = ''.obs;
  var displayUserPhoto = ''.obs;
  var displayUserEmail = ''.obs;
  bool isSignIn = false;
  var googleSignIn = GoogleSignIn();

  static final authBox = GetStorage();

  void visabilityFun() {
    isVisability = !isVisability;
    update();
  }

  void checkBox() {
    isCheckBox = !isCheckBox;
    update();
  }

  @override
  void onInit() {
    googleSinUpApp();
    super.onInit();
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
        displayUserName.value = name;

        auth.currentUser!.updateDisplayName(displayUserName.value);
      });
      Get.offAllNamed(Routes.mainScreen);

      update();
      isSignIn = true;
      authBox.write("isSignIn", isSignIn);
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
        displayUserName.value = auth.currentUser!.displayName!;
      });
      Get.offAllNamed(Routes.mainScreen);
      isSignIn = true;
      authBox.write("isSignIn", isSignIn);
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

  void googleSinUpApp() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      displayUserName.value = googleUser!.displayName!;
      displayUserPhoto.value = googleUser.photoUrl!;
      displayUserEmail.value = googleUser.email;

      GoogleSignInAuthentication googleSignInAuthentication =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );

      await auth.signInWithCredential(credential);

      isSignIn = true;
      authBox.write("auth", isSignIn);
      update();

      Get.offNamed(Routes.mainScreen);
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void facebookSignUp() {}

  void logOutFromApp() async {
    try {
      await auth.signOut();
      await GoogleSignIn().signOut();
      displayUserName.value = '';
      displayUserPhoto.value = '';
      Get.offAllNamed(Routes.welcomeScreen);
      update();
      isSignIn = false;
      authBox.remove('isSignIn');
    } catch (error) {
      Get.snackbar('Error', error.toString(),
          backgroundColor: pinkClr,
          borderRadius: 15,
          snackPosition: SnackPosition.TOP);
    }
  }
}
