import 'package:flutter/material.dart';
import 'package:tangoeye_survey/model/survey_model.dart';
import 'package:tangoeye_survey/survey/widget/single_choice_widget.dart';
import 'package:tangoeye_survey/survey/widget/textfield_widget.dart';

import '../../utils/enums.dart';
import '../../utils/shared_functions.dart';
import '../widget/image_widget.dart';
import '../widget/multiple_choice_widget.dart';
import '../widget/confirmation_widget.dart';

class InputView extends StatelessWidget {
  final Question question;
  final String type;
  final bool isValidationType;
  final int currentSectionIndex;

  const InputView(
      {super.key,
      required this.question,
      required this.currentSectionIndex,
      this.isValidationType = false,
      required this.type});

  @override
  Widget build(BuildContext context) {
    switch (answerType(type)) {
      case AnswerType.descriptive:
        return SurveyTextField(
          question: question,
          sectionIndex: currentSectionIndex,
          isValidationType: isValidationType,
        );
      case AnswerType.image:
        return ImageWidget(
          question: question,
          sectionIndex: currentSectionIndex,
          isValidationType: isValidationType,
        );
      case AnswerType.multiplechoicemultiple:
        return MultipleChoiceWidget(
          question: question,
          sectionIndex: currentSectionIndex,
          isValidationType: isValidationType,
        );
      case AnswerType.multiplechoicesingle:
        return RadioWidget(
            question: question,
            sectionIndex: currentSectionIndex,
            isValidationType: isValidationType);
      case AnswerType.yesNo:
        return ConfirmationWidget(
            question: question, sectionIndex: currentSectionIndex);
      default:
        return const SizedBox();
    }
  }
}
