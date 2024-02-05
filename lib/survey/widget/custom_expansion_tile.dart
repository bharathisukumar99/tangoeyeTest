import 'package:flutter/material.dart';
import 'package:tangoeye_survey/survey/widget/section_header.dart';

class CustomExpansionTile extends StatelessWidget {
  const CustomExpansionTile(
      {super.key,
      required this.children,
      required this.title,
      required this.countString});

  final String title;
  final String countString;
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        collapsedBackgroundColor:
            const Color.fromARGB(255, 173, 173, 173).withOpacity(0),
        backgroundColor:
            const Color.fromARGB(255, 168, 168, 168).withOpacity(0),
        shape: const RoundedRectangleBorder(),
        childrenPadding: const EdgeInsets.all(10),
        title: SectionHeader(title: title, countString: countString),
        children: children);
  }
}
