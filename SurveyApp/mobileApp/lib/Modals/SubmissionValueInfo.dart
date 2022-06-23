class SubmissionValueInfo{
  int Id;
int SubmissionId;
String QuestionText;
String AnswerText;

  Map<String, dynamic> toJson() {
    return {
      'Id': Id,
      'SubmissionId': SubmissionId,
      'QuestionText': QuestionText,
      'AnswerText': AnswerText
    };
  }
}