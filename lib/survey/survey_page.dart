import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tangoeye_survey/home.dart';
import 'package:tangoeye_survey/survey/bloc/survey_bloc.dart';
import 'package:tangoeye_survey/utils/enums.dart';
import '../utils/constants.dart';
import '../utils/shared_functions.dart';
import 'view/survey_page_view.dart';

class SurveyPage extends StatelessWidget {
  const SurveyPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(context, true),
      body: BlocConsumer<SurveyBloc, SurveyState>(
        listener: (context, state) {
          if (state.overallValidation == OverallValidation.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                behavior: SnackBarBehavior.floating,
                content: const Text(
                  "Successfully Validated",
                  textAlign: TextAlign.center,
                ),
                backgroundColor: Colors.green.shade900,
              ),
            );
          }
          if (state.overallValidation == OverallValidation.failure) {
            state.sections.asMap().forEach((key, value) {
              if (key == state.scrollingIndex.sectionIndex) {
                value.controller.expand();
                scrollTo(
                    value.questions[state.scrollingIndex.questionIndex].key);
              } else {
                value.controller.collapse();
              }
            });
          }
        },
        builder: (context, state) {
          return SurveyPageView(
            sections: state.sections,
            onUserSave: (selectionInfo) {
              if (selectionInfo.type == AnswerType.image ||
                  selectionInfo.isValidation! &&
                      selectionInfo.validationType == AnswerType.image) {
                context
                    .read<SurveyBloc>()
                    .add(ImageUploadEvent(info: selectionInfo));
              } else if (selectionInfo.isValidation!) {
                context
                    .read<SurveyBloc>()
                    .add(SetValidationAnswer(info: selectionInfo));
              } else {
                context.read<SurveyBloc>().add(SetAnswer(info: selectionInfo));
              }
            },
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<SurveyBloc, SurveyState>(
          builder: (context, state) {
            return FilledButton(
              style: FilledButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5))),
              onPressed: () {
                if (state.overallValidation == OverallValidation.initial ||
                    state.overallValidation == OverallValidation.failure) {
                  context.read<SurveyBloc>().add(ValidationChecker());
                } else {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => const Home()),
                      (Route<dynamic> route) => false);
                }
              },
              child: Text(state.overallValidation == OverallValidation.success
                  ? 'Submit Answers'
                  : 'Review Answers'),
            );
          },
        ),
      ),
    );
  }
}
