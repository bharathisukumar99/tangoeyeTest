import 'package:flutter/material.dart';
import 'package:tangoeye_survey/survey/widget/section_header.dart';

class CustomExpansionTile extends StatelessWidget {
  const CustomExpansionTile(
      {super.key,
      required this.children,
      required this.title,
      required this.countString,
      required this.controller});

  final String title;
  final String countString;
  final List<Widget> children;
  final ExpansionTileController controller;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        controller: controller,
        collapsedBackgroundColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        iconColor: Colors.grey.shade900,
        maintainState: true,
        shape: const RoundedRectangleBorder(),
        childrenPadding: const EdgeInsets.all(10),
        title: SectionHeader(title: title, countString: countString),
        children: children);
  }
}
