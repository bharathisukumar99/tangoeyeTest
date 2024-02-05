import 'package:flutter/material.dart';

import 'enums.dart';

String formattedNumber(int number) => '$number'.padLeft(2, '0');

String questionCountString(int number) =>
    '(${formattedNumber(number)}/${formattedNumber(number)} questions)';

AnswerType? answerType(String stringValue) =>
    AnswerType.values.byName(stringValue == "yes/no" ? "yesNo" : stringValue);

Color primary(context) => Theme.of(context).primaryColor;

AnswerType validationTypeValues(String type) {
  switch (type) {
    case "Capture Image":
      return AnswerType.image;
    case "Descriptive Answer":
      return AnswerType.descriptive;
    default:
      return AnswerType.empty;
  }
}

AnswerType answerTypeValue(String type) {
  switch (type) {
    case "image":
      return AnswerType.image;
    case "descriptive":
      return AnswerType.descriptive;
    case "yes/no":
      return AnswerType.yesNo;
    case "multiplechoicemultiple":
      return AnswerType.multiplechoicemultiple;
    case "multiplechoicesingle":
      return AnswerType.multiplechoicesingle;
    default:
      return AnswerType.empty;
  }
}
