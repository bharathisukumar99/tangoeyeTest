import 'package:flutter/material.dart';

import '../../model/selection_info_model.dart';
import '../../model/survey_model.dart';
import '../../utils/constants.dart';
import '../../utils/enums.dart';
import '../../utils/shared_functions.dart';
import '../widget/custom_expansion_tile.dart';
import '../widget/section_header.dart';
import 'survey_inputs.dart';
import 'survey_question_view.dart';

class SurveyPageView extends StatelessWidget {
  final List<Section> sections;
  const SurveyPageView(
      {super.key, required this.sections, required this.onUserSave});

  final void Function(SelectionInfo)? onUserSave;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: sections.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Stack(
            children: [
              const ListTile(
                selected: true,
                selectedTileColor: Color(0xffF9FAFB),
              ),
              CustomExpansionTile(
                title: sections[index].sectionName,
                countString:
                    questionCountString(sections[index].questions.length),
                children: List.generate(
                  sections[index].questions.length,
                  (i) => QuestionView(
                    currentWidget: InputView(
                      isValidationType: false,
                      validation: sections[index].questions[i].validation,
                      type: sections[index].questions[i].answerType,
                      onSave: (selectionInfo) => onUserSave!(
                          selectionInfo.copyWith(
                              sectionIndex: index,
                              questionIndex: i,
                              type: sections[index].questions[i].answerType,
                              isValidation: false)),
                      question: sections[index].questions[i],
                    ),
                    validationWidget: sections[index]
                            .questions[i]
                            .userAnswered
                            .isNotEmpty
                        ? Builder(
                            builder: (context) {
                              Set<AnswerType> data = Set.from(sections[index]
                                  .questions[i]
                                  .userAnswered
                                  .map((e) => e.answer.validationType));
                              return Column(
                                  children: data
                                      .map(
                                        (e) => Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: InputView(
                                            validation: sections[index]
                                                .questions[i]
                                                .validation,
                                            question:
                                                sections[index].questions[i],
                                            type: e,
                                            isValidationType: true,
                                            onSave: (selectionInfo) => onUserSave!(
                                                selectionInfo.copyWith(
                                                    sectionIndex: index,
                                                    questionIndex: i,
                                                    type: sections[index]
                                                        .questions[i]
                                                        .answerType,
                                                    validationType: sections[
                                                            index]
                                                        .questions[i]
                                                        .userAnswered[selectionInfo
                                                            .userAnsweredIndex!]
                                                        .answer
                                                        .validationType,
                                                    isValidation: true)),
                                          ),
                                        ),
                                      )
                                      .toList());
                            },
                          )
                        : const SizedBox(),
                    indexString:
                        '${formattedNumber(sections[index].questions[i].qno)}*',
                    questionTitle: sections[index].questions[i].qname,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
