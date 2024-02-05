import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader(
      {super.key, required this.title, required this.countString});

  final String title;
  final String countString;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Text(
          countString,
          textScaler: const TextScaler.linear(
            0.9,
          ),
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
