import 'dart:io';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:hoclaixe/models/SignModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:hoclaixe/models/QuestionModel.dart';

Future<Database> initializeDatabase() async {
  var path = await getDatabasesPath();
  var dbPath = (path + '/' + "data5.sqlite");

  // copy db file from Assets folder to Documents folder (only if not already there...)
  if (FileSystemEntity.typeSync(dbPath) == FileSystemEntityType.notFound) {
    ByteData data = await rootBundle.load("assets/databases/data.sqlite");
    writeToFile(data, dbPath);
  }
  else {
    print(FileSystemEntity.typeSync(dbPath));
    }
  // Open/create the database at a given path
  var departuresDatabase = await openDatabase(dbPath);
  return departuresDatabase;
}

Future<QuestionModel> getQuestion(Database departuresDatabase) async {
  var question = new QuestionModel();
  List questions = await departuresDatabase.rawQuery(
      'SELECT * FROM ZQUESTION LIMIT 1');
  for (var q in questions){
    question = QuestionModel.fromJson(q);
  }
  print(questions);
  print(question);
  return question;
}

Future<SignModel> getSign(Database departuresDatabase) async {
  var sign = new SignModel();
  List signs = await departuresDatabase.rawQuery(
      'SELECT * FROM ZSIGN LIMIT 1');
  for (var s in signs) {
    sign = SignModel.fromJson(s);
  }
  print(signs.length.toString());
  return sign;
}
Future<List<SignModel>> getListSign(Database departuresDatabase,int typeSign) async {
  var listsign09 = new List<SignModel>();
  List sign09 = await departuresDatabase.rawQuery(
      'SELECT* FROM ZSIGN WHERE ZSIGNCATEGORY ='+typeSign.toString());
  for (var sign in sign09) {
    listsign09.add( SignModel.fromJson(sign));
  }
  print(listsign09);
  return listsign09;
}

// HERE IS WHERE THE CODE CRASHES (WHEN TRYING TO WRITE THE LOADED BYTES)
  void writeToFile(ByteData data, String path) {
    final buffer = data.buffer;
    new File(path).writeAsBytes(
        buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  }