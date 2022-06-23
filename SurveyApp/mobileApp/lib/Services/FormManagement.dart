import 'dart:convert';

import 'package:survey_beta/Modals/ResponseInfo.dart';
import 'package:survey_beta/Modals/SubmissionInfo.dart';
import 'package:survey_beta/Backbone/Constants.dart';

import 'package:http/http.dart' as http;

import 'CommonMethods.dart';

Future<ResponseInfo> SubmitForms(List<SubmissionInfo> oForms)async {
  var oSubmissions = [];
  for(var oForm in oForms){
    oSubmissions.add(oForm.toJson());
  }

  final response = await http.post(
    Uri.parse(Constants.baseURL+"?methodName=SubmitForms"),
    headers: <String, String>{
      'Content-type': 'application/json',
      'Accept': 'application/json',
    },
    body: jsonEncode(oSubmissions)
  );
  ConsoleWritleLine(jsonDecode(response.body));
  return ResponseInfo.fromJson(jsonDecode(response.body));
}