import 'package:flutter/material.dart';
import 'package:survey_beta/Backbone/Constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void ProcessBox(context) {
  showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: EdgeInsets.only(left: 25, right: 25),

        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        content: Container(

          width: 250,
          height: 120,
          child: SingleChildScrollView(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: SpinKitFadingCircle(
                    color: Colors.grey,
                    size: 50.0,
                  ),
                ),
                Expanded(
                  child: Padding(padding: const EdgeInsets.only(top: 30),
                    child: Text(
                      "Please wait. \nRecord is syncing to the central server.",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                      softWrap: false,
                    ),),
                )

              ],
            ),
          ),
        ),
      );

    },
  );
}