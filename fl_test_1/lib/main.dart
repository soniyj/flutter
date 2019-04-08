import 'package:flutter/material.dart';

import 'mflutter.dart';
import 'strings.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: Strings.appTitle,
      theme: ThemeData(primaryColor: Colors.green.shade800),
      home: MWidget(),
    );
  }
}





