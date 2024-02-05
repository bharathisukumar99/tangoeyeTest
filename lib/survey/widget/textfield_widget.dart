// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:tangoeye_survey/model/selection_info_model.dart';
import 'package:tangoeye_survey/model/survey_model.dart';

import '../../utils/enums.dart';

class SurveyTextField extends StatefulWidget {
  const SurveyTextField(
      {Key? key,
      required this.isValidationType,
      this.onChanged,
      this.question,
      this.errorTitle,
      this.validation})
      : super(key: key);
  final bool isValidationType;
  final bool? validation;
  final Question? question;
  final String? errorTitle;

  final void Function(SelectionInfo)? onChanged;

  @override
  State<SurveyTextField> createState() => _SurveyTextFieldState();
}

class _SurveyTextFieldState extends State<SurveyTextField> {
  late TextEditingController controller;
  @override
  void initState() {
    controller = TextEditingController();
    if (!widget.isValidationType) {
      controller.text = widget.question!.answers.first.answer;
    } else {
      controller.text = widget.question!.userAnswered
          .firstWhere((element) =>
              element.answer.validationType == AnswerType.descriptive)
          .answer
          .validationAnswer;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: (value) => widget.onChanged!(SelectionInfo().copyWith(
          value: value,
          answerIndex: 0,
          isValidation: widget.isValidationType,
          userAnsweredIndex: widget.isValidationType
              ? widget.question!.userAnswered.indexWhere((element) =>
                  element.answer.validationType == AnswerType.descriptive)
              : null)),
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      decoration: InputDecoration(
        errorText: widget.errorTitle,
        isDense: true,
        contentPadding: const EdgeInsets.all(10),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 2,
            color: Color(0xffEBEBEC),
          ),
        ),
        hintText: widget.isValidationType
            ? 'Remarks if any'
            : 'Enter your answer here',
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
