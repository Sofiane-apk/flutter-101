import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/bmi_screen/bmi_screen.dart';
import 'package:flutter_application_1/modules/messengerscreen/messangerscreen.dart';
import 'package:flutter_application_1/modules/userscreen/user_screen.dart';

import 'modules/bmi_screen_result/bmi_screen_result.dart';
import 'modules/loginscreen/loginscreen.dart';

void main() {
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    if (kReleaseMode) exit(1);
  };
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
