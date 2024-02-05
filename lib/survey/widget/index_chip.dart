import 'package:flutter/material.dart';

class IndexChip extends StatelessWidget {
  const IndexChip(
      {super.key,
      required this.indexString,
      required this.validation,
      required this.extraValidation});
  final String indexString;
  final bool? validation;
  final bool? extraValidation;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: ShapeDecoration(
          color: validation != null &&
                  validation! &&
                  extraValidation != null &&
                  extraValidation!
              ? Colors.green.shade100
              : const Color(0xffF2F4F7),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (validation != null &&
              validation! &&
              extraValidation != null &&
              extraValidation!)
            const Icon(Icons.done),
          Text(
            indexString,
            textScaler: const TextScaler.linear(0.9),
          ),
        ],
      ),
    );
  }
}
