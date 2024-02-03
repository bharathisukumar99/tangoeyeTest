import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tangoeye_survey/utils/shared_functions.dart';

import '../../model/survey_model.dart';
import '../bloc/survey_bloc.dart';

class ConfirmationWidget extends StatelessWidget {
  const ConfirmationWidget({
    super.key,
    required this.question,
    required this.sectionIndex,
  });
  final Question question;
  final int sectionIndex;
  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(
      question.answers.length,
      (index) => Expanded(
        child: InkWell(
          onTap: () {
            context.read<SurveyBloc>().add(SingleSelectAndConfirmationEvent(
                sectionIndex: sectionIndex,
                questionIndex: question.qno - 1,
                selectedOptionNumber: index));
          },
          child: Container(
            margin: const EdgeInsets.all(5),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: question.selectedAnsweroptionNumber == index
                  ? primary(context).withOpacity(0.1)
                  : Colors.white,
              border: question.selectedAnsweroptionNumber == index
                  ? null
                  : Border.all(color: const Color(0xffEBEBEC), width: 2),
            ),
            child: Text(
              question.answers[index].answer,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: question.selectedAnsweroptionNumber == index
                      ? primary(context)
                      : Colors.black),
            ),
          ),
        ),
      ),
    ));
  }
}
