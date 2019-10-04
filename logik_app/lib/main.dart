import 'package:flutter/material.dart';
import 'helpers/Constants.dart';
import 'LoginPage.dart';
import './Arkit/SpherePage.dart';
import './Arkit/ImagePage.dart';

void main() => runApp(LogikApp());

class LogikApp extends StatelessWidget {

  final routes = <String, WidgetBuilder> {
    LoginPage.tag: (context) => LoginPage(),
    ShperePage.tag: (context) => ShperePage(),
    ImageDetectionPage.tag: (context) => ImageDetectionPage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: ThemeData(
        primaryColor: appDarkGreyColor,
      ),
      //home: LoginPage(),
      // home: ShperePage(),
      home: ImageDetectionPage(),
      routes: routes,
    );
  }
  
}