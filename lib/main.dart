import 'package:barberia/database/app_database.dart';
import 'package:barberia/models/barbeiro.dart';
import 'package:barberia/screens/barbeiros.dart';
import 'package:barberia/screens/barbeiros_form.dart';
import 'package:barberia/screens/dashboard.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(BytebankApp());
}

class BytebankApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Color.fromARGB(255, 81, 180, 88),
          hintColor: Colors.blueAccent[700],
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.blueAccent[700],
            textTheme: ButtonTextTheme.primary,
          )),
      home: Dashboard(),
    );
  }
}
