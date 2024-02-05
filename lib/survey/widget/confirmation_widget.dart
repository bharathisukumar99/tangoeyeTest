import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tangoeye_survey/model/selection_info_model.dart';
import 'package:tangoeye_survey/utils/shared_functions.dart';

import '../../model/survey_model.dart';
import '../bloc/survey_bloc.dart';

class ConfirmationWidget extends StatelessWidget {
  final void Function(SelectionInfo)? onConfirmationSave;

  ConfirmationWidget(
      {super.key, required this.onConfirmationSave, required this.question});
  final Question question;
  final SelectionInfo info = SelectionInfo();
  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(
      question.answers.length,
      (index) => Expanded(
        child: InkWell(
          onTap: () => onConfirmationSave!(info.copyWith(answerIndex: index))
          /* {
            context.read<SurveyBloc>().add(
                  SetAnswer(
                    info: SelectionInfo(
                      sectionIndex: sectionIndex,
                      questionIndex: question.qno - 1,
                      userAnswer: UserAnswered(
                        index: index,
                        answer: question.answers[index],
                      ),
                    ),
                  ),
                );
          }, */
          ,
          child: Container(
            margin: const EdgeInsets.all(5),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: question.userAnswered.firstOrNull?.index == index
                  ? primary(context).withOpacity(0.1)
                  : Colors.white,
              border: question.userAnswered.firstOrNull?.index == index
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
