import 'package:survey_beta/Backbone/Constants.dart';

void ConsoleWritleLine(text){
  if(Constants.IS_DEBUG_MODE){
    print(text);
  }
}