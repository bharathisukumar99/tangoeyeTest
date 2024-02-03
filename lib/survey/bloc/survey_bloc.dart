import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

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
    on<SingleSelectAndConfirmationEvent>((event, emit) async {
      emit(state.copyWith(
          sections: state.sections
            ..[event.sectionIndex]
                .questions[event.questionIndex]
                .selectedAnsweroptionNumber = event.selectedOptionNumber));
    });
    on<AddMultiSelectEvent>((event, emit) async {
      emit(
        state.copyWith(
          sections: state.sections
            ..[event.sectionIndex]
                .questions[event.questionIndex]
                .selectedAnsweroptionNumbers
                .add(event.value),
        ),
      );
    });
    on<DeleteMultiSelectEvent>((event, emit) async {
      emit(
        state.copyWith(
          sections: state.sections
            ..[event.sectionIndex]
                .questions[event.questionIndex]
                .selectedAnsweroptionNumbers
                .remove(event.value),
        ),
      );
    });
    on<ImageUploadEvent>((event, emit) async {
      final ImagePicker picker = ImagePicker();
      final XFile? photo = await picker.pickImage(source: ImageSource.camera);
      if (photo != null) {
        if (event.isValidationType) {
          emit(
            state.copyWith(
              sections: state.sections
                ..[event.sectionIndex]
                    .questions[event.questionIndex]
                    .answers
                    .firstWhere((element) => element.validationType == 'image')
                    .validationAnswer = photo.path,
            ),
          );
        } else {
          emit(
            state.copyWith(
              sections: state.sections
                ..[event.sectionIndex]
                    .questions[event.questionIndex]
                    .answers
                    .first
                    .answer = photo.path,
            ),
          );
        }
      }
    });
    on<ReviewEvent>((event, emit) async {});
  }
}
