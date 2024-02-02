import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tangoeye_survey/utils/enums.dart';
import 'package:tangoeye_survey/core/service.dart';
import 'package:tangoeye_survey/model/survey_model.dart';

part 'survey_event.dart';
part 'survey_state.dart';

class SurveyBloc extends Bloc<SurveyEvent, SurveyState> {
  SurveyBloc() : super(SurveyState()) {
    on<FetchSurveyEvent>((event, emit) async {
      emit(state.copyWith(
        surveyStatus: FetchStatus.loading,
      ));
      var response = await RemoteService.fetchSurvey();
      if (response.code == 200 && response.status == "success") {
        emit(
          state.copyWith(
              sections: response.data[0].sections,
              surveyStatus: FetchStatus.success),
        );
      } else {
        emit(
          state.copyWith(surveyStatus: FetchStatus.failure),
        );
      }
    });
  }
}
