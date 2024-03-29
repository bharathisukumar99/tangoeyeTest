// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tangoeye_survey/survey/bloc/survey_bloc.dart';
import 'package:tangoeye_survey/survey/widget/image_placeholder.dart';
import 'package:tangoeye_survey/utils/enums.dart';

import '../../model/selection_info_model.dart';
import '../../model/survey_model.dart';
import 'image_icon.dart';

class ImageWidget extends StatelessWidget {
  final Question question;
  final bool isValidationType;
  const ImageWidget({
    Key? key,
    required this.question,
    required this.onUserSave,
    required this.isValidationType,
  }) : super(key: key);
  final void Function(SelectionInfo) onUserSave;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (question.answers.first.referenceImage.isNotEmpty)
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.network(
                question.answers.first.referenceImage,
                errorBuilder: (context, url, error) => const Center(
                    child: Text("Reference Image Url Issue Occured")),
              ),
            ),
          ),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: AspectRatio(
            aspectRatio: 1,
            child: question.answers.first.answer.isEmpty ||
                    isValidationType &&
                        question.userAnswered.any((element) =>
                            element.answer.validationType == AnswerType.image &&
                            element.answer.validationAnswer.isEmpty)
                ? SizedBox(
                    child: !question.allowUploadfromGallery
                        ? InkWell(
                            onTap: () {
                              onUserSave(
                                SelectionInfo().copyWith(
                                    answerIndex: 0,
                                    userAnsweredIndex: isValidationType
                                        ? question.userAnswered.indexWhere(
                                            (element) =>
                                                element.answer.validationType ==
                                                AnswerType.image)
                                        : null),
                              );
                            },
                            child: const ImagePlaceholder(
                              imageIcon: ImageIconWidget(
                                icon: Icons.photo_camera_outlined,
                                title: 'Click to Capture Image',
                              ),
                            ),
                          )
                        : ImagePlaceholder(
                            imageIcon: Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () => onUserSave(
                                      SelectionInfo().copyWith(
                                          answerIndex: 0,
                                          isCamera: false,
                                          userAnsweredIndex: isValidationType
                                              ? question.userAnswered
                                                  .indexWhere((element) =>
                                                      element.answer
                                                          .validationType ==
                                                      AnswerType.image)
                                              : null),
                                    ),
                                    child: const ImageIconWidget(
                                      icon: Icons.collections,
                                      title: 'Gallery',
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () => onUserSave(
                                      SelectionInfo().copyWith(
                                          answerIndex: 0,
                                          isCamera: true,
                                          userAnsweredIndex: isValidationType
                                              ? question.userAnswered
                                                  .indexWhere((element) =>
                                                      element.answer
                                                          .validationType ==
                                                      AnswerType.image)
                                              : null),
                                    ),
                                    child: const ImageIconWidget(
                                      icon: Icons.photo_camera_outlined,
                                      title: 'Camera',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                  )
                : Stack(
                    children: [
                      Image.file(
                        File(!isValidationType
                            ? question.answers.first.answer
                            : question.userAnswered
                                .firstWhere((element) =>
                                    element.answer.validationType ==
                                    AnswerType.image)
                                .answer
                                .validationAnswer),
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
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
                          onPressed: () => onUserSave(SelectionInfo().copyWith(
                              answerIndex: 0,
                              isReupload: true,
                              userAnsweredIndex: isValidationType
                                  ? question.userAnswered.indexWhere(
                                      (element) =>
                                          element.answer.validationType ==
                                          AnswerType.image)
                                  : null)),
                          icon: const Icon(Icons.file_upload_outlined),
                          label: const Text('Reupload Image'),
                        ),
                      )
                    ],
                  ),
          ),
        ),
      ],
    );
  }
}
