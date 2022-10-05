import 'package:flutter/material.dart';
import 'package:shop_app/view/widgets/text_utils.dart';

import '../widgets/category_widget/category_widget.dart';

class CatecoryScreen extends StatelessWidget {
  const CatecoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextUtils(
            text: '  Categorys',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          const SizedBox(
            height: 15,
          ),
          CategoryWidget()
        ],
      ),
    );
  }
}
