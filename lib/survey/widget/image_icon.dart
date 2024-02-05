// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class ImageIconWidget extends StatelessWidget {
  final IconData icon;
  final String title;

  const ImageIconWidget({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            CircleAvatar(
              backgroundColor: const Color(0xffEAF7FF),
              radius: 30,
              child: CircleAvatar(
                radius: 20,
                backgroundColor: const Color(0xffDAF1FF),
                foregroundColor: Colors.blue,
                child: Icon(icon),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(color: Colors.blue),
          ),
        )
      ],
    );
  }
}
