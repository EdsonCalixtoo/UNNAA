import 'package:UNNA/Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.blue,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.light
  ));


    runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0XFF2C2B4B),
        primarySwatch: Colors.blue,
        fontFamily: "Poppins"
      ),
       debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
