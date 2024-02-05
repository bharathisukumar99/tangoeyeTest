import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tangoeye_survey/survey/bloc/survey_bloc.dart';
import 'package:tangoeye_survey/utils/enums.dart';

import '../model/survey_model.dart';
import 'view/survey_page_view.dart';

class SurveyPage extends StatelessWidget {
  const SurveyPage({super.key, required this.sections});
  final List<Section> sections;
  @override
  Widget build(BuildContext context) {
    return SurveyPageView(
      sections: sections,
      onUserSave: (selectionInfo) {
        if (selectionInfo.type == AnswerType.image ||
            selectionInfo.isValidation! &&
                selectionInfo.validationType == AnswerType.image) {
          context.read<SurveyBloc>().add(ImageUploadEvent(info: selectionInfo));
        } else {
          context.read<SurveyBloc>().add(SetAnswer(info: selectionInfo));
        }
      },
    );
  }
}
