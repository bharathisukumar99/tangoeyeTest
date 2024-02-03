import 'package:flutter/material.dart';

import '../../model/survey_model.dart';
import '../../utils/constants.dart';
import '../../utils/shared_functions.dart';
import 'survey_question_view.dart';

class SurveyPageView extends StatelessWidget {
  final List<Section> sections;
  const SurveyPageView({super.key, required this.sections});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ListView.builder(
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
                ExpansionTile(
                  collapsedBackgroundColor:
                      const Color.fromARGB(255, 173, 173, 173).withOpacity(0),
                  backgroundColor:
                      const Color.fromARGB(255, 168, 168, 168).withOpacity(0),
                  shape: const RoundedRectangleBorder(),
                  childrenPadding: const EdgeInsets.all(10),
                  title: Row(
                    children: [
                      Expanded(
                        child: Text(
                          sections[index].sectionName,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        '(${formattedNumber(sections[index].questions.length)}/${formattedNumber(sections[index].questions.length)} questions)',
                        textScaler: const TextScaler.linear(
                          0.9,
                        ),
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  children: List.generate(
                    sections[index].questions.length,
                    (i) => QuestionView(
                      question: sections[index].questions[i],
                      currentSectionIndex: index,
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
