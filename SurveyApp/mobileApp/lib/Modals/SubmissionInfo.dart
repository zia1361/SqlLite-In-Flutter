import 'SubmissionValueInfo.dart';

class SubmissionInfo{
  int Id;
String DeviceId;
DateTime SubmittedOn;
DateTime SyncedOn;
int FormId;
List<SubmissionValueInfo> oValues;
bool IsError;
String ErrorMessage;
  Map<String, dynamic> toMap() {
    return {
      'Id': Id,
      'DeviceId': DeviceId,
      'SubmittedOn': SubmittedOn,
      'SyncedOn': SyncedOn,
      'FormId': FormId,
      'oValues': oValues,
    };
  }

}