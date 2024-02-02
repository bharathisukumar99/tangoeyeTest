// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'survey_bloc.dart';

class SurveyState {
  FetchStatus surveyStatus;
  List<Section> sections;
  SurveyState({
    this.surveyStatus = FetchStatus.initial,
    this.sections = const [],
  });

  SurveyState copyWith({
    FetchStatus? surveyStatus,
    List<Section>? sections,
  }) {
    return SurveyState(
      surveyStatus: surveyStatus ?? this.surveyStatus,
      sections: sections ?? this.sections,
    );
  }
}
