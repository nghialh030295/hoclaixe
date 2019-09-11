import 'dart:convert';

QuestionModel questionFromJson(String str) {
  final jsonDataQuestion = json.decode(str);
  return QuestionModel.fromJson(jsonDataQuestion);
}

class QuestionModel {
  String zQuestion;
  String zAnswers;
  String zAnswerDesc;
  String zOption1;
  String zOption2;
  String zOption3;
  String zOption4;
  String zImageQuestion;
  int zIndex;
  QuestionModel({
    this.zQuestion,
    this.zAnswers,
    this.zAnswerDesc,
    this.zOption1,
    this.zOption2,
    this.zOption3,
    this.zOption4,
    this.zImageQuestion,
    this.zIndex,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      zQuestion: json["ZQUESTIONCONTENT"] as String,
      zAnswers: json["ZANSWERS"],
      zAnswerDesc: json["ZANSWERDESC"],
      zOption1: json["ZOPTION1"],
      zOption2: json["ZOPTION2"],
      zOption3: json["ZOPTION3"],
      zOption4: json["ZOPTION4"],
      zImageQuestion: json["ZIMAGE"],
      zIndex: json["ZINDEX"] as int,
    );
  }
}
