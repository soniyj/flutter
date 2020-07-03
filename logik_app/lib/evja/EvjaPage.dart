import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logik_app/evja/SensorListViewScreen.dart';

class EvjaPage extends StatelessWidget {
  static String tag = 'evja-page';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Evja Page',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Evja Page')),
        body: BodyLayout(),
      ),
    );
  }
}

class BodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }
}

Widget _myListView(BuildContext context) {
  return ListView(
    children: <Widget>[
      ListTile(
        title: Text('Sen'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          _pushScreen(context, SensorListVievScreen());
        },
      ),
    ]
  );
}

void _pushScreen(BuildContext context, Widget screen) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => screen),
  );
}