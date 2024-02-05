// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:tangoeye_survey/model/selection_info_model.dart';

class SurveyTextField extends StatelessWidget {
  const SurveyTextField(
      {Key? key,
      required this.isValidationType,
      this.onChanged,
      this.validation})
      : super(key: key);
  final bool isValidationType;
  final bool? validation;
  final void Function(SelectionInfo)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) =>
          onChanged!(SelectionInfo().copyWith(value: value, answerIndex: 0)),
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      decoration: InputDecoration(
        errorText: (validation ?? false) ? 'Please enter value' : null,
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
