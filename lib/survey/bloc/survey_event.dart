// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'survey_bloc.dart';

abstract class SurveyEvent {}

class FetchSurveyEvent extends SurveyEvent {}

class SingleSelectAndConfirmationEvent extends SurveyEvent {
  int sectionIndex;
  int questionIndex;
  int selectedOptionNumber;
  SingleSelectAndConfirmationEvent({
    required this.sectionIndex,
    required this.questionIndex,
    required this.selectedOptionNumber,
  });
}

class AddMultiSelectEvent extends SurveyEvent {
  int sectionIndex;
  int questionIndex;
  int value;
  AddMultiSelectEvent({
    required this.sectionIndex,
    required this.questionIndex,
    required this.value,
  });
}

class DeleteMultiSelectEvent extends SurveyEvent {
  int sectionIndex;
  int questionIndex;
  int value;
  DeleteMultiSelectEvent({
    required this.sectionIndex,
    required this.questionIndex,
    required this.value,
  });
}

class ConfirmationChoiceEvent extends SurveyEvent {
  int sectionIndex;
  int questionIndex;
  int value;
  ConfirmationChoiceEvent({
    required this.sectionIndex,
    required this.questionIndex,
    required this.value,
  });
}

class ImageUploadEvent extends SurveyEvent {
  int sectionIndex;
  int questionIndex;
  int value;
  bool isValidationType;
  ImageUploadEvent({
    required this.sectionIndex,
    required this.questionIndex,
    required this.value,
    required this.isValidationType,
  });
}

class ReviewEvent extends SurveyEvent {}
