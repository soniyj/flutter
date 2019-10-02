import 'package:flutter/material.dart';
import 'helpers/Constants.dart';
import 'LoginPage.dart';
import 'ArkitPage.dart';

void main() => runApp(LogikApp());

class LogikApp extends StatelessWidget {

  final routes = <String, WidgetBuilder> {
    'loginPageTag': (context) => LoginPage(),
    'arkitPageTag': (context) => ArkitPage(),
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
      home: ArkitPage(),
      routes: routes,
    );
  }
  
}