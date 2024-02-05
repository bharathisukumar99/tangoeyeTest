// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'survey_bloc.dart';

class SurveyState {
  FetchStatus surveyStatus;
  List<Section> sections;
  bool overallValidation;

  List<StoreCheckList> storeCheckList;

  SurveyState({
    this.surveyStatus = FetchStatus.initial,
    this.sections = const [],
    this.overallValidation = false,
    this.storeCheckList = const [],
  });

  SurveyState copyWith({
    FetchStatus? surveyStatus,
    List<Section>? sections,
    bool? overallValidation,
    List<StoreCheckList>? storeCheckList,
  }) {
    return SurveyState(
      surveyStatus: surveyStatus ?? this.surveyStatus,
      sections: sections ?? this.sections,
      overallValidation: overallValidation ?? this.overallValidation,
      storeCheckList: storeCheckList ?? this.storeCheckList,
    );
  }
}
