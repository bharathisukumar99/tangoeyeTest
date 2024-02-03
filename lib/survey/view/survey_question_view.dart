import 'package:flutter/material.dart';
import '../../model/survey_model.dart';
import '../../utils/shared_functions.dart';
import 'survey_inputs.dart';

class QuestionView extends StatelessWidget {
  const QuestionView(
      {super.key, required this.question, required this.currentSectionIndex});

  final Question question;
  final int currentSectionIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: ShapeDecoration(
                color: const Color(0xffF2F4F7),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100))),
            child: Text(
              '${formattedNumber(question.qno)}*',
              textScaler: const TextScaler.linear(0.9),
            ),
          ),
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
                    question.qname,
                    textScaler: const TextScaler.linear(1.2),
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InputView(
                    question: question,
                    type: question.answerType,
                    currentSectionIndex: currentSectionIndex,
                  ),
                  if (question.selectedAnsweroptionNumber != null)
                    InputView(
                      question: question,
                      type: question
                          .answers[question.selectedAnsweroptionNumber!]
                          .validationType,
                      currentSectionIndex: currentSectionIndex,
                      isValidationType: true,
                    ),
                  if (question.selectedAnsweroptionNumbers.isNotEmpty)
                    Builder(builder: (context) {
                      Set<String> data = Set.from(question
                          .selectedAnsweroptionNumbers
                          .map((e) => question.answers[e].validationType));
                      return Column(
                          children: data
                              .map((e) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: InputView(
                                      question: question,
                                      type: e,
                                      currentSectionIndex: currentSectionIndex,
                                      isValidationType: true,
                                    ),
                                  ))
                              .toList());
                    }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
