// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:tangoeye_survey/model/survey_model.dart';
import 'package:tangoeye_survey/survey/widget/textfield_widget.dart';

import '../../model/selection_info_model.dart';
import '../../utils/enums.dart';
import '../widget/confirmation_widget.dart';
import '../widget/image_widget.dart';
import '../widget/multiple_choice_widget.dart';
import '../widget/single_choice_widget.dart';

class InputView extends StatelessWidget {
  final void Function(SelectionInfo) onSave;
  final Question question;
  final bool? validation;
  final AnswerType type;
  final bool isValidationType;
  const InputView(
      {Key? key,
      required this.onSave,
      required this.question,
      this.validation,
      required this.type,
      required this.isValidationType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case AnswerType.descriptive:
        return SurveyTextField(
          isValidationType: isValidationType,
          onChanged: (selectionInfo) => onSave,
          validation: validation,
        );
      case AnswerType.image:
        return ImageWidget(
          question: question,
          isValidationType: isValidationType,
          onUserSave: (info) => onSave(info),
        );
      case AnswerType.multiplechoicemultiple:
        return MultipleChoiceWidget(
          question: question,
          onUserSave: (info) => onSave(info),
        );
      case AnswerType.multiplechoicesingle:
        return RadioWidget(
          question: question,
          onUserSave: (info) => onSave(info),
        );

      case AnswerType.yesNo:
        return ConfirmationWidget(
          question: question,
          onConfirmationSave: (selectionInfo) => onSave(selectionInfo),
        );
      default:
        return const SizedBox();
    }
  }
}
