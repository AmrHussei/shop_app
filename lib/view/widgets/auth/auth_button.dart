import 'package:flutter/material.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:shop_app/view/widgets/text_utils.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({super.key, required this.text, required this.onPressed});

  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: mainColor,
        minimumSize: const Size(350, 50),
      ),
      child: TextUtils(
          text: text,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white),
    );
  }
}
