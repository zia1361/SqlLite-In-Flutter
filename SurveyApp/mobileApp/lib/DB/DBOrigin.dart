import 'package:device_info_plus/device_info_plus.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;
import 'package:survey_beta/Modals/SubmissionInfo.dart';
import 'package:survey_beta/Modals/SubmissionValueInfo.dart';
class DBOrigin{
  Database database;
  Future<void> CreateDB() async {
    var databasesPath = await getDatabasesPath();
    String path = p.join(databasesPath, 'demo.db');
    // open the database
    database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          // When creating the db, create the table
          await db.execute(
              'CREATE TABLE FormSubmission (Id INTEGER PRIMARY KEY autoincrement, FormId INTEGER, DeviceId TEXT, SubmittedOn DATETIME)');
          await db.execute(
              'CREATE TABLE FormSubmissionValues (Id INTEGER PRIMARY KEY autoincrement, SubmissionId INTEGER, QuestionText TEXT, AnswerText TEXT)');

        });

    await database.close();
  }
  Future<void> CreateFormValueTable() async {
    var databasesPath = await getDatabasesPath();
    String path = p.join(databasesPath, 'demo.db');
    // open the database
    database = await openDatabase(path, version: 1);
    await database.execute(
        'CREATE TABLE FormSubmissionValues (Id INTEGER PRIMARY KEY autoincrement, SubmissionId INTEGER, QuestionText TEXT, AnswerText TEXT)');

    await database.close();
  }
  Future<void> Insert(int formId, List<SubmissionValueInfo> oValues) async{
    var databasesPath = await getDatabasesPath();
    String path = p.join(databasesPath, 'demo.db');

    // open the database
    database = await openDatabase(path, version: 1);
    await database.transaction((txn) async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      int id = await txn.rawInsert(
          'INSERT INTO FormSubmission(FormId, DeviceId, SubmittedOn) VALUES(?, ?, ?)',
          [formId, androidInfo.androidId, DateTime.now().toString()]);
      for(var oValue in oValues){
        oValue.Id = await txn.rawInsert(
            'INSERT INTO FormSubmissionValues(SubmissionId, QuestionText, AnswerText) VALUES(?, ?, ?)',
            [id, oValue.QuestionText, oValue.AnswerText]);
      }
    });
    await database.close();
  }

  Future<void> SyncNow(callback) async{
    var databasesPath = await getDatabasesPath();
    String path = p.join(databasesPath, 'demo.db');

    // open the database
    database = await openDatabase(path, version: 1);
    List<Map> eSubmissions = await database.rawQuery('SELECT * FROM FormSubmission');
    var oSubmissions = <SubmissionInfo>[];
    for(var eSubmission in eSubmissions){
      SubmissionInfo oSubmission = new SubmissionInfo();
      oSubmission.Id = eSubmission["Id"];
      oSubmission.FormId = eSubmission["FormId"];
      oSubmission.DeviceId = eSubmission["DeviceId"];
      oSubmission.SubmittedOn = DateTime.parse(eSubmission["SubmittedOn"]);
      oSubmission.SyncedOn = DateTime.now();
      List<Map> eValues = await database.rawQuery('SELECT * FROM FormSubmissionValues where SubmissionId = ?',[eSubmission["Id"]]);
      var oValues = <SubmissionValueInfo>[];

      for(var eValue in eValues){
        SubmissionValueInfo oValue = new SubmissionValueInfo();
        oValue.Id = eValue["Id"];
        oValue.SubmissionId = eValue["SubmissionId"];
        oValue.QuestionText = eValue["QuestionText"];
        oValue.AnswerText = eValue["AnswerText"];
        oValues.add(oValue);
      }
      oSubmission.oValues = oValues;
      oSubmissions.add(oSubmission);

    }
    String innerText = "";
    for(var oSubmission in oSubmissions){
      innerText += oSubmission.toMap().toString() + "*******";
      for(var oValue in oSubmission.oValues){
        innerText += oValue.toMap().toString() + "&&&&&&";
      }
    }

    callback(innerText);



    await database.close();
  }

  Future<void> Delete(int submissionId) async{
    var databasesPath = await getDatabasesPath();
    String path = p.join(databasesPath, 'demo.db');

    // open the database
    database = await openDatabase(path, version: 1);
    int count = await database
        .rawDelete('DELETE FROM FormSubmission where Id = ?', [submissionId]);
    count = await database
        .rawDelete('DELETE FROM FormSubmissionValues where SubmissionId = ?', [submissionId]);

    await database.close();
  }
  Future<void> DeleteAll() async{
    var databasesPath = await getDatabasesPath();
    String path = p.join(databasesPath, 'demo.db');

    // open the database
    database = await openDatabase(path, version: 1);
    int count = await database
        .rawDelete('DELETE FROM FormSubmission');
    count = await database
        .rawDelete('DELETE FROM FormSubmissionValues');

    await database.close();
  }

}