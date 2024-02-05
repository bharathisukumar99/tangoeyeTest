import 'package:flutter/material.dart';

class IndexChip extends StatelessWidget {
  const IndexChip({super.key, required this.indexString});
  final String indexString;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: ShapeDecoration(
          color: const Color(0xffF2F4F7),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))),
      child: Text(
        indexString,
        textScaler: const TextScaler.linear(0.9),
      ),
    );
  }
}
