// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'survey_bloc.dart';

abstract class SurveyEvent {}

class FetchSurveyEvent extends SurveyEvent {}

class SingleSelectAndConfirmationEvent extends SurveyEvent {
  SelectionInfo info;
  SingleSelectAndConfirmationEvent({
    required this.info,
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
  SelectionInfo info;
  DeleteMultiSelectEvent({
    required this.info,
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
  SelectionInfo info;
  ImageUploadEvent({
    required this.info,
  });
}

class ReviewEvent extends SurveyEvent {}

class ExpandAllExpansionTile extends SurveyEvent {}

class ValidationChecker extends SurveyEvent {}

class SetAnswer extends SurveyEvent {
  SelectionInfo info;
  SetAnswer({
    required this.info,
  });
}

class SetValidationAnswer extends SurveyEvent {
  SelectionInfo info;
  SetValidationAnswer({
    required this.info,
  });
}
