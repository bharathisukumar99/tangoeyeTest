import 'package:flutter/material.dart';

class QuestionView extends StatelessWidget {
  const QuestionView(
      {super.key,
      required this.currentWidget,
      required this.validationWidget,
      required this.indexChip,
      required this.errorWidget,
      required this.questionTitle});

  final Widget currentWidget;
  final Widget validationWidget;
  final Widget errorWidget;
  final String questionTitle;
  final Widget indexChip;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          indexChip,
          Card(
            surfaceTintColor: Colors.white,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: Colors.grey.shade200),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    questionTitle,
                    textScaler: const TextScaler.linear(1.2),
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  currentWidget,
                  validationWidget,
                  errorWidget
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
