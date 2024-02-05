// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ImagePlaceholder extends StatelessWidget {
  final Widget imageIcon;
  const ImagePlaceholder({
    Key? key,
    required this.imageIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImageContainerWidget(imagePlaceholder: imageIcon);
  }
}

class ImageContainerWidget extends StatelessWidget {
  const ImageContainerWidget({
    Key? key,
    required this.imagePlaceholder,
  }) : super(key: key);
  final Widget imagePlaceholder;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: const Color(0xffF6FCFF),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.blue,
          ),
        ),
        child: imagePlaceholder);
  }
}
