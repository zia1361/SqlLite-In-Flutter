class ResponseInfo {
  final bool IsError;
  final String ErrorMessage;

  const ResponseInfo({this.IsError, this.ErrorMessage});

  factory ResponseInfo.fromJson(Map<String, dynamic> json) {
    return ResponseInfo(
      IsError: json['IsError'],
      ErrorMessage: json['ErrorMessage'],
    );
  }
}