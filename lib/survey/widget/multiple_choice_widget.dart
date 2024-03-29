// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/selection_info_model.dart';
import '../../model/survey_model.dart';
import '../bloc/survey_bloc.dart';

class MultipleChoiceWidget extends StatelessWidget {
  const MultipleChoiceWidget({
    Key? key,
    required this.onUserSave,
    required this.question,
  }) : super(key: key);
  final void Function(SelectionInfo) onUserSave;
  final Question question;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        checkboxTheme: CheckboxThemeData(
          side: MaterialStateBorderSide.resolveWith(
            (states) {
              if (states.contains(MaterialState.selected)) {
                return const BorderSide(
                    color: Colors.blue,
                    width: 2,
                    strokeAlign: BorderSide.strokeAlignOutside);
              }
              return null;
            },
          ),
        ),
        colorScheme: const ColorScheme.light(
          onSurface: Color(0xffDADEE4),
          primary: Color(0Xff00A3FF),
        ),
      ),
      child: Transform.translate(
        offset: const Offset(-5, 0),
        child: Column(
          children: List.generate(
            question.answers.length,
            (index) => CheckboxListTile(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              controlAffinity: ListTileControlAffinity.leading,
              value: question.userAnswered
                  .any((element) => element.index == index),
              onChanged: (val) => onUserSave(
                  SelectionInfo().copyWith(answerIndex: index, value: val)),
              visualDensity: VisualDensity.compact,
              contentPadding: EdgeInsets.zero,
              checkColor: Colors.blue,
              fillColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.selected)) {
                  return Colors.blue.shade100;
                }
                return null;
              }),
              checkboxShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              title: Text(
                question.answers[index].answer,
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
