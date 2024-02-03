import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tangoeye_survey/survey/bloc/survey_bloc.dart';
import 'package:tangoeye_survey/survey/widget/image_placeholder.dart';

import '../../model/survey_model.dart';

class ImageWidget extends StatelessWidget {
  final Question question;
  final int sectionIndex;
  final bool isValidationType;
  const ImageWidget({
    super.key,
    required this.question,
    required this.sectionIndex,
    required this.isValidationType,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: AspectRatio(
        aspectRatio: 1,
        child: question.answerType == 'image' &&
                    question.answers.first.answer.isEmpty ||
                isValidationType &&
                    question.answers
                        .firstWhere(
                            (element) => element.validationType == 'image')
                        .validationAnswer
                        .isEmpty
            ? InkWell(
                onTap: () {
                  context.read<SurveyBloc>().add(
                        ImageUploadEvent(
                            sectionIndex: sectionIndex,
                            questionIndex: question.qno - 1,
                            value: 0,
                            isValidationType: isValidationType),
                      );
                },
                child: const ImagePlaceholder())
            : Stack(
                children: [
                  Image.file(
                    File(!isValidationType
                        ? question.answers.first.answer
                        : question.answers
                            .firstWhere(
                                (element) => element.validationType == 'image')
                            .validationAnswer),
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: FilledButton.icon(
                      style: FilledButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: Colors.black.withOpacity(0.6)),
                      onPressed: () {
                        context.read<SurveyBloc>().add(
                              ImageUploadEvent(
                                  sectionIndex: sectionIndex,
                                  questionIndex: question.qno - 1,
                                  value: 0,
                                  isValidationType: isValidationType),
                            );
                      },
                      icon: const Icon(Icons.file_upload_outlined),
                      label: const Text('Reupload Image'),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
