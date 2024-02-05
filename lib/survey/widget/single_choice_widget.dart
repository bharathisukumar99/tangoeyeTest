// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tangoeye_survey/model/survey_model.dart';
import 'package:tangoeye_survey/survey/bloc/survey_bloc.dart';

import '../../model/selection_info_model.dart';

class RadioWidget extends StatelessWidget {
  final Question question;
  final void Function(SelectionInfo) onUserSave;
  const RadioWidget({
    Key? key,
    required this.question,
    required this.onUserSave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(-5, 0),
      child: Column(
        children: List.generate(
          question.answers.length,
          (index) => Theme(
            data: ThemeData(
                colorScheme: const ColorScheme.light(
                    onSurface: Color(0xffDADEE4), primary: Colors.blue)),
            child: ListTile(
              minVerticalPadding: 0,
              //  dense: true,
              contentPadding: const EdgeInsets.all(0),
              title: Text(
                question.answers[index].answer,
                style: TextStyle(color: Colors.grey.shade900),
              ),
              minLeadingWidth: 0,
              horizontalTitleGap: 10,
              visualDensity: VisualDensity.compact,
              leading: Radio(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity: VisualDensity.compact,
                  value: index,
                  groupValue: question.userAnswered.firstOrNull?.index,
                  onChanged: (value) =>
                      onUserSave(SelectionInfo().copyWith(answerIndex: value))
                  // {
                  // context.read<SurveyBloc>().add(
                  //       SetAnswer(
                  //         info: SelectionInfo(
                  //           sectionIndex: sectionIndex,
                  //           questionIndex: question.qno - 1,
                  //           userAnswer: UserAnswered(
                  //               index: index, answer: question.answers[index]),
                  //         ),
                  //       ),
                  //     );
                  // },
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
