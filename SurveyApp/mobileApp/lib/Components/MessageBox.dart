import 'package:flutter/material.dart';
import 'package:survey_beta/Backbone/Constants.dart';


Future<void> _showSubmissionDialog(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Success'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[

              Text('Form has been submitted.'),

            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
void MessageBox(String messageText, MessageType messageType, context) {
  showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: EdgeInsets.only(left: 25, right: 25),
        title: Center(child: Text((() {
          if(messageType == MessageType.Error){
            return "Oops!";
          }else if(messageType == MessageType.Success){
            return "Success";
          }
          else if(messageType == MessageType.Info){
            return "Info";
          }else{
            return "Warning";
          }

          return "anything but true";
        })())
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        content: Container(

          width: 300,
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(top: 5, bottom: 5),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(((){
                            if(messageType == MessageType.Info){
                              return Constants.InfoColor.value;
                            }else if(messageType == MessageType.Warning){
                              return Constants.WarningColor.value;
                            }else if(messageType == MessageType.Error){
                              return Constants.DangerColor.value;
                            }else{
                              return Constants.SuccessColor.value;
                            }

                          })()),
                          width: 3
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(100))
                    ),
                    child: Icon(((){
                      if(messageType == MessageType.Info){
                        return Constants.InfoIcon.icon;
                      }else if(messageType == MessageType.Warning){
                        return Constants.WarningIcon.icon;
                      }else if(messageType == MessageType.Error){
                        return Constants.DangerIcon.icon;
                      }else{
                        return Constants.SuccessIcon.icon;
                      }
                    })(), color: Color(((){
                      if(messageType == MessageType.Info){
                        return Constants.InfoColor.value;
                      }else if(messageType == MessageType.Warning){
                        return Constants.WarningColor.value;
                      }else if(messageType == MessageType.Error){
                        return Constants.DangerColor.value;
                      }else{
                        return Constants.SuccessColor.value;
                      }
                    })()),
                      size: 70,
                    ),
                  ),
                  Text(
                      messageText
                  ),
                ],
              ),
            ),
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],);

    },
  );
}

