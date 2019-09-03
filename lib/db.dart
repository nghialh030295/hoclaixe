import 'dart:io';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:convert';
import 'package:hoclaixe/models/QuestionModel.dart';

Future<Database> initializeDatabase() async {

  var path = await getDatabasesPath();
  print(path);
  var dbPath = (path+'/'+"assets/databases/data2.sqlite");
  print(dbPath);
  print(FileSystemEntity.typeSync(dbPath));

  // copy db file from Assets folder to Documents folder (only if not already there...)
  if (FileSystemEntity.typeSync(dbPath) == FileSystemEntityType.notFound) {
    ByteData data = await rootBundle.load("assets/databases/data.sqlite");
    print(data);
    writeToFile(data, dbPath);
  }
  else
    {
    }
  // Open/create the database at a given path
  var departuresDatabase = await openDatabase(dbPath);
  print(departuresDatabase.isOpen);
  List question43 = await departuresDatabase.rawQuery('SELECT ZQUESTIONCONTENT,'
      'ZINDEX,ZANSWERS, ZOPTION1,ZOPTION2,ZOPTION3, ZOPTION4 FROM ZQUESTION '
      'where ZQUESTIONTYPE = 43 AND ZINDEX <= 21 ');
  List question44 = await departuresDatabase.rawQuery('SELECT ZQUESTIONCONTENT FROM ZQUESTION where ZQUESTIONTYPE = 44');
  List question45 = await departuresDatabase.rawQuery('SELECT ZQUESTIONCONTENT FROM ZQUESTION where ZQUESTIONTYPE = 45');
  List question46 = await departuresDatabase.rawQuery('SELECT ZQUESTIONCONTENT FROM ZQUESTION where ZQUESTIONTYPE = 46');
  List question47 = await departuresDatabase.rawQuery('SELECT ZQUESTIONCONTENT FROM ZQUESTION where ZQUESTIONTYPE = 47');
  List question48 = await departuresDatabase.rawQuery('SELECT ZQUESTIONCONTENT FROM ZQUESTION where ZQUESTIONTYPE = 48');
  List question49 = await departuresDatabase.rawQuery('SELECT ZQUESTIONCONTENT FROM ZQUESTION where ZQUESTIONTYPE = 49');
  print(question43);
  print(question43.length);
  var ques = question43[Random().nextInt(question43.length)];
  print(ques);
  for (var key in ques.keys) {
    print('$key :  ${ques[key]}');
  }
  return departuresDatabase;
}

Future<QuestionModel> getQuestion(Database departuresDatabase) async
{
  var result= new QuestionModel();
  List question43 = await departuresDatabase.rawQuery('SELECT ZQUESTIONCONTENT,'
      'ZINDEX,ZANSWERS, ZOPTION1,ZOPTION2,ZOPTION3, ZOPTION4 FROM ZQUESTION '
      'where ZQUESTIONTYPE = 43 AND ZINDEX <= 21 ');
  List question44 = await departuresDatabase.rawQuery('SELECT ZQUESTIONCONTENT FROM ZQUESTION where ZQUESTIONTYPE = 44');
  List question45 = await departuresDatabase.rawQuery('SELECT ZQUESTIONCONTENT FROM ZQUESTION where ZQUESTIONTYPE = 45');
  List question46 = await departuresDatabase.rawQuery('SELECT ZQUESTIONCONTENT FROM ZQUESTION where ZQUESTIONTYPE = 46');
  List question47 = await departuresDatabase.rawQuery('SELECT ZQUESTIONCONTENT FROM ZQUESTION where ZQUESTIONTYPE = 47');
  List question48 = await departuresDatabase.rawQuery('SELECT ZQUESTIONCONTENT FROM ZQUESTION where ZQUESTIONTYPE = 48');
  List question49 = await departuresDatabase.rawQuery('SELECT ZQUESTIONCONTENT FROM ZQUESTION where ZQUESTIONTYPE = 49');
  print(question43);
  print(question43.length);
  var ques = question43[Random().nextInt(question43.length)];
  print(ques);
  for (var key in ques.keys) {
    print('$key :  ${ques[key]}');
  }
  result=QuestionModel.fromJson(ques);
  return result;
}
// HERE IS WHERE THE CODE CRASHES (WHEN TRYING TO WRITE THE LOADED BYTES)
void writeToFile(ByteData data, String path) {
  final buffer = data.buffer;
  return new File(path).writeAsBytesSync(
      buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
}