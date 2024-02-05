// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'survey_bloc.dart';

abstract class SurveyEvent {}

class FetchSurveyEvent extends SurveyEvent {}

class DeleteMultiSelectEvent extends SurveyEvent {
  SelectionInfo info;
  DeleteMultiSelectEvent({
    required this.info,
  });
}

class ImageUploadEvent extends SurveyEvent {
  bool isCamera;
  SelectionInfo info;
  ImageUploadEvent({
    this.isCamera = true,
    required this.info,
  });
}

class ReviewEvent extends SurveyEvent {}

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

class SetCurrentCheckList extends SurveyEvent {
  int index;
  SetCurrentCheckList({
    required this.index,
  });
}
