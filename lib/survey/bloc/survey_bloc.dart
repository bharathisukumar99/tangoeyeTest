import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:tangoeye_survey/utils/enums.dart';
import 'package:tangoeye_survey/core/service.dart';
import 'package:tangoeye_survey/model/survey_model.dart';

import '../../model/selection_info_model.dart';
import '../../model/survey_model.dart';

part 'survey_event.dart';
part 'survey_state.dart';

class SurveyBloc extends Bloc<SurveyEvent, SurveyState> {
  SurveyBloc() : super(SurveyState()) {
    on<FetchSurveyEvent>((event, emit) async {
      emit(state.copyWith(
          surveyStatus: FetchStatus.loading, overallValidation: false));
      var response = await RemoteService.fetchSurvey();
      if (response.code == 200 && response.status == "success") {
        emit(
          state.copyWith(
            storeCheckList: response.data,
            surveyStatus: FetchStatus.success,
          ),
        );
      } else {
        emit(
          state.copyWith(surveyStatus: FetchStatus.failure),
        );
      }
    });

    on<DeleteMultiSelectEvent>((event, emit) async {
      SelectionInfo data = event.info;
      emit(
        state.copyWith(
          sections: state.sections
            ..[data.sectionIndex!]
                .questions[data.questionIndex!]
                .userAnswered
                .removeWhere((element) => element.index == data.answerIndex),
        ),
      );
    });
    on<ImageUploadEvent>((event, emit) async {
      if (event.info.isReupload &&
          state.sections[event.info.sectionIndex!]
              .questions[event.info.questionIndex!].allowUploadfromGallery) {
        if (event.info.isValidation!) {
          add(SetValidationAnswer(info: event.info.copyWith(value: "")));
        } else {
          add(SetAnswer(info: event.info.copyWith(value: "")));
        }
      } else {
        final ImagePicker picker = ImagePicker();
        final XFile? photo;
        if (event.info.isCamera) {
          photo = await picker.pickImage(source: ImageSource.camera);
        } else {
          photo = await picker.pickImage(source: ImageSource.gallery);
        }

        if (photo != null) {
          if (event.info.isValidation!) {
            add(SetValidationAnswer(
                info: event.info.copyWith(value: photo.path)));
          } else {
            add(SetAnswer(info: event.info.copyWith(value: photo.path)));
          }
        }
      }
    });
    on<ReviewEvent>((event, emit) {});
    on<SetCurrentCheckList>((event, emit) {
      emit(
          state.copyWith(sections: state.storeCheckList[event.index].sections));
    });

    on<ValidationChecker>((event, emit) {
      for (final (i, section) in state.sections.indexed) {
        for (final (j, Question question) in section.questions.indexed) {
          if (question.userAnswered.isEmpty ||
              question.userAnswered
                  .any((element) => element.answer.answer.isEmpty)) {
            emit(state.copyWith(
                sections: state.sections..[i].questions[j].validated = false));
          } else {
            emit(state.copyWith(
                sections: state.sections..[i].questions[j].validated = true));
          }
          if (question.userAnswered.every((element) =>
              element.answer.validationAnswer.isEmpty &&
              element.answer.validation == true)) {
            emit(state.copyWith(
                sections: state.sections
                  ..[i].questions[j].extraValidated = false));
          } else {
            emit(state.copyWith(
                sections: state.sections
                  ..[i].questions[j].extraValidated = true));
          }
        }
      }
      var validated = state.sections.every((element) => element.questions.every(
          (element) =>
              element.validated == true && element.extraValidated == true));
      emit(state.copyWith(overallValidation: validated));
    });
    on<SetAnswer>(setAnswer);
    on<SetValidationAnswer>((event, emit) {
      SelectionInfo data = event.info;
      var userAnswered = state.sections[data.sectionIndex!]
          .questions[data.questionIndex!].userAnswered;
      for (var i = 0; i < userAnswered.length; i++) {
        if (userAnswered[i].answer.validationType == data.validationType) {
          emit(state.copyWith(
            sections: state.sections
              ..[data.sectionIndex!]
                  .questions[data.questionIndex!]
                  .userAnswered[i]
                  .answer
                  .validationAnswer = data.value,
          ));
        }
      }
    });
  }

  void setAnswer(event, emit) {
    SelectionInfo data = event.info;
    if (data.type == AnswerType.image || data.type == AnswerType.descriptive) {
      emit(state.copyWith(
          sections: state.sections
            ..[data.sectionIndex!]
                .questions[data.questionIndex!]
                .answers[data.answerIndex!]
                .answer = data.value));
    }
    if (state.sections[data.sectionIndex!].questions[data.questionIndex!]
            .userAnswered.isEmpty ||
        data.type == AnswerType.multiplechoicemultiple && data.value == true) {
      emit(state.copyWith(
        sections: state.sections
          ..[data.sectionIndex!]
              .questions[data.questionIndex!]
              .userAnswered
              .add(UserAnswered(
                  index: data.answerIndex!,
                  answer: state
                      .sections[data.sectionIndex!]
                      .questions[data.questionIndex!]
                      .answers[data.answerIndex!])),
      ));
    } else if (data.type == AnswerType.multiplechoicemultiple &&
        data.value == false) {
      add(DeleteMultiSelectEvent(info: data));
    } else {
      emit(
        state.copyWith(
          sections: state.sections
            ..[data.sectionIndex!]
                    .questions[data.questionIndex!]
                    .userAnswered[0] =
                UserAnswered(
                    index: data.answerIndex!,
                    answer: state
                        .sections[data.sectionIndex!]
                        .questions[data.questionIndex!]
                        .answers[data.answerIndex!]),
        ),
      );
    }
  }
}
