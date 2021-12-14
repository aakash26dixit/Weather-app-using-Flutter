import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/first.dart';
import 'package:flutter_application_1/pages/start.dart';
import 'package:flutter_application_1/utils/routes.dart';


void main(){
  runApp(myApp());
}

class myApp extends StatefulWidget {

  @override
  _myAppState createState() => _myAppState();
}

class _myAppState extends State<myApp> {

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      initialRoute: MyRoutes.startRoute,
      routes:{
        MyRoutes.startRoute: (context) => weatherPage(),
        MyRoutes.firstRoute: (context) => first()
      }
      
    );
  }
}