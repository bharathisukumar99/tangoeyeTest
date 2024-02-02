part of 'survey_bloc.dart';

@immutable
sealed class SurveyEvent {}

class FetchSurveyEvent extends SurveyEvent {}
