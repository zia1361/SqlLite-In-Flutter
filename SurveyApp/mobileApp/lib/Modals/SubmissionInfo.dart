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

  Map<String, dynamic> toJson() {
    return {
      'Id': Id,
      'DeviceId': DeviceId,
      'SubmittedOn': SubmittedOn.toString(),
      'SyncedOn': SyncedOn.toString(),
      'FormId': FormId,
      'oValues': oValues,
    };
  }


}