import 'package:flutter/material.dart';

class SurveyTextField extends StatelessWidget {
  const SurveyTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
      ),
    );
  }
}
