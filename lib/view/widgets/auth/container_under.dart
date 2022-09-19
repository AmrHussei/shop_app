import 'package:flutter/material.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:shop_app/view/widgets/text_utils.dart';

class ContainerUnder extends StatelessWidget {
  const ContainerUnder(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.text2});

  final String text;
  final String text2;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 6.8,
      decoration: const BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtils(
            text: text,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          TextButton(
            onPressed: onPressed,
            child: TextUtils(
              text: text2,
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: darkSettings,
            ),
          ),
        ],
      ),
    );
  }
}
