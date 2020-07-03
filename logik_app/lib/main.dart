import 'package:flutter/material.dart';
import 'helpers/Constants.dart';
import 'LoginPage.dart';
import 'HomePage.dart';
import './Arkit/SpherePage.dart';
import './Arkit/ImagePage.dart';
import 'package:logik_app/evja/EvjaPage.dart';

void main() => runApp(LogikApp());

class LogikApp extends StatelessWidget {

  final routes = <String, WidgetBuilder> {
    LoginPage.tag: (context) => LoginPage(),
    HomePage.tag: (context) => HomePage(),
    ShperePage.tag: (context) => ShperePage(),
    ImageDetectionPage.tag: (context) => ImageDetectionPage(),
    EvjaPage.tag: (context) => EvjaPage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: ThemeData(
        primaryColor: appDarkGreyColor,
      ),
      // home: LoginPage(),
      // home: HomePage(),
      // home: ShperePage(),
      // home: ImageDetectionPage(),
      home: EvjaPage(),
      routes: routes,
    );
  }
  
}