

import 'package:flutter/material.dart';

class Constants{

  //Colors
  static Color primaryColor = Color(0xff1d2a4d);
  static Color sectionColor = Color(0xff1f0661);
  static const MaterialColor kPrimaryColor = const MaterialColor(
    0xFF0E7AC7,
    const <int, Color>{
      50: const Color(0xff1d2a4d),
      100: const Color(0xff1d2a4d),
      200: const Color(0xff1d2a4d),
      300: const Color(0xff1d2a4d),
      400: const Color(0xff1d2a4d),
      500: const Color(0xff1d2a4d),
      600: const Color(0xff1d2a4d),
      700: const Color(0xff1d2a4d),
      800: const Color(0xff1d2a4d),
      900: const Color(0xff1d2a4d),
    },
  );
  static Color textColor = Color(0xffffffff);
  static Color InfoColor = Color(0xff17a2b8);
  static Color WarningColor = Color(0xffffc107);
  static Color DangerColor = Color(0xffdc3545);
  static Color SuccessColor = Color(0xff28a745);

  //Icons
  static Icon InfoIcon = Icon(Icons.info);
  static Icon WarningIcon = Icon(Icons.warning);
  static Icon DangerIcon = Icon(Icons.dangerous);
  static Icon SuccessIcon = Icon(Icons.check_circle);

  static String baseURL = "https://bsite.net/zia01/Api/apicall.ashx";
  static bool IS_DEBUG_MODE = true;
}

enum MessageType{
  Error,
  Success,
  Info,
  Warning
}