import 'package:flutter/material.dart';
import 'package:shop_app/utils/theme.dart';

// ignore: must_be_immutable
class SizedList extends StatefulWidget {
  const SizedList({super.key});

  @override
  State<SizedList> createState() => _SizedListState();
}

class _SizedListState extends State<SizedList> {
  final List<String> listOfSize = ['S', 'M', 'L', 'XL', 'XXL'];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) {
          return InkWell(
            onTap: (() {
              setState(() {
                currentIndex = index;
              });
            }),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              height: 60,
              decoration: BoxDecoration(
                  color: currentIndex == index
                      ? mainColor.withOpacity(0.4)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      color: Colors.grey.withOpacity(0.4), width: 2)),
              child: Center(
                child: Text(
                  listOfSize[index],
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
            ),
          );
        }),
        separatorBuilder: ((context, index) {
          return const SizedBox(width: 10);
        }),
        itemCount: listOfSize.length,
      ),
    );
  }
}
