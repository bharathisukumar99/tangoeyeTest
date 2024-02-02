import 'dart:convert';

Response responseFromJson(String str) => Response.fromJson(json.decode(str));

class Response {
  int code;
  String status;
  String message;
  List<StoreCheckList> data;

  Response({
    required this.code,
    required this.status,
    required this.message,
    required this.data,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        data: List<StoreCheckList>.from(
            json["data"].map((x) => StoreCheckList.fromJson(x))),
      );
}

class StoreCheckList {
  String id;
  String checkListName;
  String scheduleStartTime;
  DateTime scheduleStartTimeIso;
  String scheduleEndTime;
  DateTime scheduleEndTimeIso;
  String checklistStatus;
  String checkListId;
  DateTime startTime;
  String submitTime;
  bool allowedOverTime;
  bool allowedStoreLocation;
  List<Section> sections;

  StoreCheckList({
    required this.id,
    required this.checkListName,
    required this.scheduleStartTime,
    required this.scheduleStartTimeIso,
    required this.scheduleEndTime,
    required this.scheduleEndTimeIso,
    required this.checklistStatus,
    required this.checkListId,
    required this.startTime,
    required this.submitTime,
    required this.allowedOverTime,
    required this.allowedStoreLocation,
    required this.sections,
  });

  factory StoreCheckList.fromJson(Map<String, dynamic> json) => StoreCheckList(
        id: json["_id"],
        checkListName: json["checkListName"],
        scheduleStartTime: json["scheduleStartTime"],
        scheduleStartTimeIso: DateTime.parse(json["scheduleStartTime_iso"]),
        scheduleEndTime: json["scheduleEndTime"],
        scheduleEndTimeIso: DateTime.parse(json["scheduleEndTime_iso"]),
        checklistStatus: json["checklistStatus"],
        checkListId: json["checkListId"],
        startTime: DateTime.parse(json["startTime"]),
        submitTime: json["submitTime"],
        allowedOverTime: json["allowedOverTime"],
        allowedStoreLocation: json["allowedStoreLocation"],
        sections: List<Section>.from(
            json["questionAnswers"].map((x) => Section.fromJson(x))),
      );
}

class Section {
  String sectionId;
  String sectionName;
  List<Question> questions;

  Section({
    required this.sectionId,
    required this.sectionName,
    required this.questions,
  });

  factory Section.fromJson(Map<String, dynamic> json) => Section(
        sectionId: json["section_id"],
        sectionName: json["sectionName"],
        questions: List<Question>.from(
            json["questions"].map((x) => Question.fromJson(x))),
      );
}

class Question {
  int qno;
  String qname;
  String answerType;
  bool runAi;
  bool allowUploadfromGallery;
  String runAiDescription;
  List<Answer> answers;

  Question({
    required this.qno,
    required this.qname,
    required this.answerType,
    required this.runAi,
    required this.allowUploadfromGallery,
    required this.runAiDescription,
    required this.answers,
  });

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        qno: json["qno"],
        qname: json["qname"],
        answerType: json["answerType"],
        runAi: json["runAI"],
        allowUploadfromGallery: json["allowUploadfromGallery"],
        runAiDescription: json["runAIDescription"],
        answers:
            List<Answer>.from(json["answers"].map((x) => Answer.fromJson(x))),
      );
}

class Answer {
  String answer;
  int answeroptionNumber;
  bool sopFlag;
  bool validation;
  String validationAnswer;
  ValidationType validationType;
  String referenceImage;
  bool? allowUploadfromGallery;

  Answer({
    required this.answer,
    required this.answeroptionNumber,
    required this.sopFlag,
    required this.validation,
    required this.validationAnswer,
    required this.validationType,
    required this.referenceImage,
    this.allowUploadfromGallery,
  });

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        answer: json["answer"],
        answeroptionNumber: json["answeroptionNumber"],
        sopFlag: json["sopFlag"],
        validation: json["validation"],
        validationAnswer: json["validationAnswer"],
        validationType: validationTypeValues.map[json["validationType"]]!,
        referenceImage: json["referenceImage"],
        allowUploadfromGallery: json["allowUploadfromGallery"],
      );
}

enum ValidationType { CAPTURE_IMAGE, DESCRIPTIVE_ANSWER, EMPTY }

final validationTypeValues = EnumValues({
  "Capture Image": ValidationType.CAPTURE_IMAGE,
  "Descriptive Answer": ValidationType.DESCRIPTIVE_ANSWER,
  "": ValidationType.EMPTY
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
