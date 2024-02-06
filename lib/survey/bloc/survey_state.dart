// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'survey_bloc.dart';

class SurveyState {
  FetchStatus surveyStatus;
  List<Section> sections;
  OverallValidation overallValidation;
  ScrollingIndex scrollingIndex;

  List<StoreCheckList> storeCheckList;

  SurveyState({
    this.surveyStatus = FetchStatus.initial,
    this.sections = const [],
    this.overallValidation = OverallValidation.initial,
    required this.scrollingIndex,
    this.storeCheckList = const [],
  });

  SurveyState copyWith({
    FetchStatus? surveyStatus,
    List<Section>? sections,
    OverallValidation? overallValidation,
    ScrollingIndex? scrollingIndex,
    List<StoreCheckList>? storeCheckList,
  }) {
    return SurveyState(
      surveyStatus: surveyStatus ?? this.surveyStatus,
      sections: sections ?? this.sections,
      overallValidation: overallValidation ?? this.overallValidation,
      scrollingIndex: scrollingIndex ?? this.scrollingIndex,
      storeCheckList: storeCheckList ?? this.storeCheckList,
    );
  }
}
