import 'package:flutter/material.dart';

import 'package:shop_app/utils/theme.dart';
import 'package:shop_app/view/widgets/text_utils.dart';

import '../widgets/home/card_item.dart';
import '../widgets/home/serch_text_form.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 4.6,
            decoration: const BoxDecoration(
              color: mainColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextUtils(
                      text: 'Find your',
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 96,
                  ),
                  const TextUtils(
                      text: 'INSPIRATION',
                      fontSize: 35,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 48,
                  ),
                  SerchFormFiled(
                    textInputType: TextInputType.text,
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.black45,
                    ),
                    hintText: 'Search with name or price',
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Align(
              alignment: Alignment.topLeft,
              child: TextUtils(
                text: 'Products',
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          CardItem()
        ],
      ),
    );
  }
}
