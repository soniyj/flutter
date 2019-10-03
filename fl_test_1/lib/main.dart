import 'package:flutter/material.dart';

import 'mflutter.dart';
import 'strings.dart';
import 'login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    MWidget.tag: (context) => MWidget(),
  };

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: Strings.appTitle,
      theme: ThemeData(primaryColor: Colors.green.shade800),
      // home: MWidget(),
      home: LoginPage(),
      routes: routes,
    );
  }
}
