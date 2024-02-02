import 'package:flutter/material.dart';

import '../../model/survey_model.dart';

class SurveyPageView extends StatelessWidget {
  final List<Section> sections;
  const SurveyPageView({super.key, required this.sections});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: sections.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ExpansionTile(
            collapsedBackgroundColor: const Color.fromARGB(255, 173, 173, 173),
            //  backgroundColor: const Color.fromARGB(255, 168, 168, 168),
            shape: const RoundedRectangleBorder(),

            childrenPadding: const EdgeInsets.all(10),
            title: Text(
              sections[index].sectionName,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            children: List.generate(
              sections[index].questions.length,
              (i) => Card(
                margin: const EdgeInsets.all(10),
                surfaceTintColor: Colors.white,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Colors.grey.shade200),
                ),
                // padding: const EdgeInsets.all(5),
                // margin: const EdgeInsets.all(5),
                // decoration: ShapeDecoration(
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(5),
                //     side: BorderSide(color: Colors.grey.shade300),
                //   ),
                // ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          sections[index].questions[i].qname,
                          textScaler: const TextScaler.linear(1.2),
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
