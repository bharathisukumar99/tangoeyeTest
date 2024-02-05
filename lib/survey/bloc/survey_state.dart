// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'survey_bloc.dart';

class SurveyState {
  FetchStatus surveyStatus;
  List<Section> sections;
  bool isExpandAll;

  SurveyState({
    this.surveyStatus = FetchStatus.initial,
    this.sections = const [],
    this.isExpandAll = false,
  });

  SurveyState copyWith({
    FetchStatus? surveyStatus,
    List<Section>? sections,
    bool? isExpandAll,
  }) {
    return SurveyState(
      surveyStatus: surveyStatus ?? this.surveyStatus,
      sections: sections ?? this.sections,
      isExpandAll: isExpandAll ?? this.isExpandAll,
    );
  }
}
