import 'package:flutter/material.dart';
import 'helpers/Constants.dart';

class HomePage extends StatelessWidget {

  static String tag = 'home-page';

  @override
  Widget build(BuildContext context) {

    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/earth.jpg'),
      ),
    );
    
    return Scaffold(
      backgroundColor: appDarkGreyColor,
      appBar: AppBar(title: const Text('Home Page')),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
          ]
        )
      ),
    );
  }

}