import 'dart:convert';

/*'''SELECT ZQUESTIONCONTENT,'
      'ZINDEX,ZANSWERS, ZOPTION1,ZOPTION2,ZOPTION3, ZOPTION4 FROM ZQUESTION '''*/
QuestionModel questionFromJson(String str) {
  final jsonData = json.decode(str);
  return QuestionModel.fromJson(jsonData);
}

String clientToJson(QuestionModel data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class QuestionModel {
  String question;
  String ANSWERS;
  String OPTION1;
  String OPTION2;
  String OPTION3;
  String OPTION4;
  int zIndex;
  QuestionModel(
      {this.question,
      this.zIndex,
      this.ANSWERS,
      this.OPTION1,
      this.OPTION2,
      this.OPTION3,
      this.OPTION4});
  Map<String, dynamic> toJson() => {
        "ZQUESTIONCONTENT": question,
        "ZINDEX": zIndex,
      };
  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
        question: json["ZQUESTIONCONTENT"] as String,
        zIndex: json["ZINDEX"] as int,
      ANSWERS: json["ZANSWERS"],
      OPTION1: json["ZOPTION1"],
      OPTION2: json["ZOPTION2"],
      OPTION3: json["ZOPTION3"],
      OPTION4: json["ZOPTION4"],
    );
  }
}
