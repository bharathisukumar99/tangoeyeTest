import 'package:flutter/material.dart';

import '../../model/survey_model.dart';

class SurveyTextField extends StatelessWidget {
  const SurveyTextField({
    super.key,
    required this.question,
    required this.sectionIndex,
    required this.isValidationType,
  });
  final Question question;
  final int sectionIndex;
  final bool isValidationType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (val) {
        if (val != null && val.isEmpty) {
          return 'Please enter value';
        }
        return null;
      },
      onSaved: (value) {},
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.all(10),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 2,
            color: Color(0xffEBEBEC),
          ),
        ),
        hintText:
            isValidationType ? 'Remarks if any' : 'Enter your answer here',
        hintStyle: const TextStyle(fontSize: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color(0xffEBEBEC),
          ),
        ),
      ),
    );
  }
}
