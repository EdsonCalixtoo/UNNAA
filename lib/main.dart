
import 'package:UNNA/screens/Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.black,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark
  ));


    runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Poppins"
      ),
       debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
