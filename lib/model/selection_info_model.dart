// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../utils/enums.dart';

class SelectionInfo {
  int? sectionIndex;
  int? questionIndex;
  int? answerIndex;
  int? userAnsweredIndex;
  dynamic value;
  AnswerType? type;
  bool? isValidation;
  AnswerType? validationType;
  SelectionInfo({
    this.sectionIndex,
    this.questionIndex,
    this.answerIndex,
    this.userAnsweredIndex,
    this.value,
    this.type,
    this.isValidation,
    this.validationType,
  });

  SelectionInfo copyWith({
    int? sectionIndex,
    int? questionIndex,
    int? answerIndex,
    int? userAnsweredIndex,
    dynamic value,
    AnswerType? type,
    bool? isValidation,
    AnswerType? validationType,
  }) {
    return SelectionInfo(
      sectionIndex: sectionIndex ?? this.sectionIndex,
      questionIndex: questionIndex ?? this.questionIndex,
      answerIndex: answerIndex ?? this.answerIndex,
      userAnsweredIndex: userAnsweredIndex ?? this.userAnsweredIndex,
      value: value ?? this.value,
      type: type ?? this.type,
      isValidation: isValidation ?? this.isValidation,
      validationType: validationType ?? this.validationType,
    );
  }
}
