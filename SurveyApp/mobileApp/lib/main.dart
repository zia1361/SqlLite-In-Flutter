
import 'dart:ui';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:survey_beta/Backbone/Constants.dart';
import 'package:survey_beta/DB/DBOrigin.dart';
import 'package:survey_beta/Modals/SubmissionInfo.dart';

import 'Modals/SubmissionValueInfo.dart';
import 'Components/MessageBox.dart';
import 'Components/ProcessBox.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Survey Beta',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Constants.kPrimaryColor,
      ),
      home: MyHomePage(title: 'Survey'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();
  String name = "";
  String email = "";
  String phone = "";
  String address = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    new DBOrigin().CreateDB();

  }
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(

      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title, style: TextStyle(color: Constants.textColor),),
        backgroundColor: Constants.primaryColor,
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              onTap: (){
                try{


                  new DBOrigin().SyncNow((value){

                    if(value.length <= 0){
                      MessageBox("No Record to sync", MessageType.Info, context);
                    }else{
                      MessageBox("Record successfully synced", MessageType.Success, context);
                    }

                  }, context);

                }catch(ex){
                  Navigator.pop(context);
                  MessageBox(ex, MessageType.Error, context);
                }

              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.cloud_upload_outlined,
                    color: Constants.textColor,
                  ),
                  Text("Sync", style: TextStyle(color: Constants.textColor),)
                ],
              ),
            ),
          ),
        ],

      ),
      body: SingleChildScrollView(

        child: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10.0),
                child:  TextField(

                  controller: nameController,
                  onChanged: (value){
                    name = value;
                  },
                  style: TextStyle(color: Constants.primaryColor),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Constants.primaryColor, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Constants.primaryColor, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: 'Name',
                    hintText: 'Enter your name',
                    focusColor: Constants.primaryColor,
                    labelStyle: TextStyle(color: Constants.primaryColor),
                  ),


                ),
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                child:  TextField(

                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value){
                    email = value;
                  },
                  style: TextStyle(color: Constants.primaryColor),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Constants.primaryColor, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Constants.primaryColor, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    focusColor: Constants.primaryColor,
                    labelStyle: TextStyle(color: Constants.primaryColor),
                  ),


                ),
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                child:  TextField(

                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  onChanged: (value){
                    phone = value;
                  },
                  style: TextStyle(color: Constants.primaryColor),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Constants.primaryColor, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Constants.primaryColor, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: 'Phone #',
                    hintText: 'Enter your phone number',
                    focusColor: Constants.primaryColor,
                    labelStyle: TextStyle(color: Constants.primaryColor),
                  ),


                ),
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                child:  TextField(

                  controller: addressController,
                  onChanged: (value){
                    address = value;
                  },
                  style: TextStyle(color: Constants.primaryColor),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Constants.primaryColor, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Constants.primaryColor, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: 'Address',
                    hintText: 'Enter your home address',
                    focusColor: Constants.primaryColor,
                    labelStyle: TextStyle(color: Constants.primaryColor),
                  ),


                ),
              ),


              Container(
                margin: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                                return Constants.primaryColor;
                               // Defer to the widget's default.
                            }),
                        foregroundColor: MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              return Constants.textColor;
                              // Defer to the widget's default.
                            }),
                      ),

                      onPressed: () {

                        if(name == ""){
                          MessageBox("Name is required field", MessageType.Warning, context);
                          return;
                        }
                        if(email == ""){
                          MessageBox("Email is required field", MessageType.Warning, context);
                          return;
                        }
                        if(phone == ""){
                          MessageBox("Phone # is required field", MessageType.Warning, context);
                          return;
                        }
                        if(address == ""){
                          MessageBox("Address is required field", MessageType.Warning, context);
                          return;
                        }
                       try{
                         var oValues = <SubmissionValueInfo>[];
                         var oValue = new SubmissionValueInfo();
                         oValue.QuestionText = "Name";
                         oValue.AnswerText = name;
                         oValues.add(oValue);
                         oValue = new SubmissionValueInfo();
                         oValue.QuestionText = "Email";
                         oValue.AnswerText = email;
                         oValues.add(oValue);
                         oValue = new SubmissionValueInfo();
                         oValue.QuestionText = "Phone number";
                         oValue.AnswerText = phone;
                         oValues.add(oValue);
                         oValue = new SubmissionValueInfo();
                         oValue.QuestionText = "Address";
                         oValue.AnswerText = address;
                         oValues.add(oValue);
                         new DBOrigin().Insert(1, oValues);
                         ClearFields();
                         MessageBox("Form Submitted", MessageType.Success, context);
                       }catch(ex){
                         MessageBox(ex, MessageType.Error, context);
                        }
                      },
                      child: Text('Submit'),
                    ),
                    SizedBox(width: 5.0,),
                    OutlinedButton(

                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              return Constants.textColor;
                              // Defer to the widget's default.
                            }),
                        foregroundColor: MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              return Constants.primaryColor;
                              // Defer to the widget's default.
                            }),

                      ),

                      onPressed: () {
                        ClearFields();
                      },
                      child: Text('Clear'),
                    ),
                  ],
                ),
              )



            ],
          ),
        ),
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void ClearFields(){
    nameController.text = "";
    emailController.text = "";
    phoneController.text = "";
    addressController.text = "";
    name = "";
    email = "";
    phone = "";
    address = "";
  }
}

