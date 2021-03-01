import 'package:flutter/material.dart';
import 'package:World_Time_App/codefiles/loading.dart';
import 'package:World_Time_App/codefiles/Home.dart';
import 'package:World_Time_App/codefiles/choose_location.dart';


void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    debugShowCheckedModeBanner: false,

    routes: {
      '/' : (context) =>Loading(),
      '/home': (context) => Home(),
      '/location' :(context) => ChooseLocation(),
    }
    ));
}






