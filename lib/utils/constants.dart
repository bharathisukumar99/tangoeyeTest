import 'package:flutter/material.dart';

final ExpansionTileController controller = ExpansionTileController();

Color surveyTileColor = const Color(0xffF9FAFB);

AppBar customAppBar(context, [bool isBack = false]) {
  return AppBar(
    leading: isBack
        ? IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          )
        : null,
    title: const Text('Store Maintenance',
        style: TextStyle(fontWeight: FontWeight.bold)),
    centerTitle: true,
  );
}
