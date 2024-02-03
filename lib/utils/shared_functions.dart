import 'package:flutter/material.dart';

import 'enums.dart';

String formattedNumber(int number) => '$number'.padLeft(2, '0');

AnswerType? answerType(String stringValue) =>
    AnswerType.values.byName(stringValue == "yes/no" ? "yesNo" : stringValue);

Color primary(context) => Theme.of(context).primaryColor;
