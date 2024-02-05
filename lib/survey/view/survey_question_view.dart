import 'package:flutter/material.dart';
import 'package:tangoeye_survey/utils/enums.dart';
import '../../model/survey_model.dart';
import '../../utils/shared_functions.dart';
import '../widget/index_chip.dart';
import 'survey_inputs.dart';

class QuestionView extends StatelessWidget {
  const QuestionView(
      {super.key,
      required this.currentWidget,
      required this.validationWidget,
      required this.indexString,
      required this.questionTitle});

  final Widget currentWidget;
  final Widget validationWidget;
  final String indexString;
  final String questionTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IndexChip(indexString: indexString),
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
                  validationWidget
                  // if (question.selectedAnsweroptionNumber != null)
                  //   InputView(
                  //     question: question,
                  //     type: question
                  //         .answers[question.selectedAnsweroptionNumber!]
                  //         .validationType,
                  //     currentSectionIndex: currentSectionIndex,
                  //     isValidationType: true,
                  //   ),
                  // if (question.userAnswered.isNotEmpty)
                  //   Builder(
                  //     builder: (context) {
                  //       Set<AnswerType> data = Set.from(question
                  //           .userAnswered
                  //           .map((e) =>  ));
                  //       return Column(
                  //           children: data
                  //               .map(
                  //                 (e) => Padding(
                  //                   padding: const EdgeInsets.symmetric(
                  //                       vertical: 10),
                  //                   child: InputView(
                  //                     question: question,
                  //                     type: e,
                  //                     currentSectionIndex: currentSectionIndex,
                  //                     isValidationType: true,
                  //                   ),
                  //                 ),
                  //               )
                  //               .toList());
                  //     },
                  //   ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
