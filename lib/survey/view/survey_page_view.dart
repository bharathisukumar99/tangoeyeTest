import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tangoeye_survey/survey/bloc/survey_bloc.dart';

import '../../model/selection_info_model.dart';
import '../../model/survey_model.dart';
import '../../utils/constants.dart';
import '../../utils/enums.dart';
import '../../utils/shared_functions.dart';
import '../widget/custom_expansion_tile.dart';
import '../widget/index_chip.dart';
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
    final overallValidation =
        context.select((SurveyBloc bloc) => bloc.state.overallValidation);
    return SingleChildScrollView(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: sections.length,
        shrinkWrap: true,
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
                  controller: sections[index].controller,
                  title: sections[index].sectionName,
                  countString:
                      questionCountString(sections[index].questions.length),
                  children: List.generate(
                    sections[index].questions.length,
                    (i) => IgnorePointer(
                      ignoring: overallValidation == OverallValidation.success,
                      child: QuestionView(
                        key: sections[index].questions[i].key,
                        indexChip: IndexChip(
                            indexString:
                                '${formattedNumber(sections[index].questions[i].qno)}*',
                            validation: sections[index].questions[i].validated,
                            extraValidation:
                                sections[index].questions[i].extraValidated),
                        currentWidget: InputView(
                          errorTitle: sections[index].questions[i].validated !=
                                          null &&
                                      !sections[index]
                                          .questions[i]
                                          .validated! ||
                                  sections[index].questions[i].extraValidated !=
                                          null &&
                                      !sections[index]
                                          .questions[i]
                                          .extraValidated!
                              ? "Please enter value"
                              : null,
                          isValidationType: false,
                          validation: sections[index].questions[i].validated,
                          type: sections[index].questions[i].answerType,
                          onSave: (selectionInfo) => onUserSave!(
                              selectionInfo.copyWith(
                                  sectionIndex: index,
                                  questionIndex: i,
                                  type: sections[index].questions[i].answerType,
                                  isValidation: false)),
                          question: sections[index].questions[i],
                        ),
                        errorWidget: sections[index].questions[i].answerType !=
                                        AnswerType.descriptive &&
                                    sections[index].questions[i].validated !=
                                        null &&
                                    !sections[index].questions[i].validated! ||
                                sections[index].questions[i].answerType !=
                                        AnswerType.descriptive &&
                                    sections[index]
                                            .questions[i]
                                            .extraValidated !=
                                        null &&
                                    !sections[index]
                                        .questions[i]
                                        .extraValidated!
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '*Please fill in all required fields',
                                  style: TextStyle(color: Colors.red.shade900),
                                ),
                              )
                            : const SizedBox(),
                        validationWidget: sections[index]
                                .questions[i]
                                .userAnswered
                                .isNotEmpty
                            ? Builder(
                                builder: (context) {
                                  Set<AnswerType> data = Set.from(
                                      sections[index]
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
                                                errorTitle: sections[index]
                                                                    .questions[
                                                                        i]
                                                                    .validated !=
                                                                null &&
                                                            !sections[index]
                                                                .questions[i]
                                                                .validated! ||
                                                        sections[index]
                                                                    .questions[
                                                                        i]
                                                                    .extraValidated !=
                                                                null &&
                                                            !sections[index]
                                                                .questions[i]
                                                                .extraValidated!
                                                    ? "Please enter value"
                                                    : null,
                                                validation: sections[index]
                                                    .questions[i]
                                                    .extraValidated,
                                                question: sections[index]
                                                    .questions[i],
                                                type: e,
                                                isValidationType: true,
                                                onSave: (selectionInfo) {
                                                  onUserSave!(
                                                    selectionInfo.copyWith(
                                                      sectionIndex: index,
                                                      questionIndex: i,
                                                      type: sections[index]
                                                          .questions[i]
                                                          .answerType,
                                                      validationType: sections[
                                                              index]
                                                          .questions[i]
                                                          .userAnswered[
                                                              selectionInfo
                                                                  .userAnsweredIndex!]
                                                          .answer
                                                          .validationType,
                                                      isValidation: true,
                                                    ),
                                                  );
                                                }),
                                          ),
                                        )
                                        .toList(),
                                  );
                                },
                              )
                            : const SizedBox(),
                        questionTitle: sections[index].questions[i].qname,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
