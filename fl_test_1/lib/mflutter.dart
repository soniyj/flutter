import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './member.dart';
import './strings.dart';
import './xmap.dart';
import './geocoding.dart';

class MWidget extends StatefulWidget {
  @override
  createState () => MWidgetState();
}

class MWidgetState extends State<MWidget> {
  
  // var _members = [];
  var _members = <Member>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  _loadData() async {
    String dataURL = "https://api.github.com/orgs/raywenderlich/members";
    http.Response response = await http.get(dataURL);

    setState(() {
      //_members = jsonDecode(response.body);
      final membersJSON = jsonDecode(response.body);
      for (var memberJSON in membersJSON) {
        final member = new Member(memberJSON["login"], memberJSON["avatar_url"]);
        _members.add(member);
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.appTitle),

      ),
      //body: Text(Strings.appTitle),
      body: ListView.builder(
        // padding: const EdgeInsets.all(16.0),
        // itemCount: _members.length,
        itemCount: _members.length * 2,
        itemBuilder: (BuildContext context, int position) {
          if (position.isOdd) return new Divider();
          final index = position ~/ 2;
          return _buildRow(index);
        },
      ),
    );
  }

  Widget _buildRow(int i) {
    // return new ListTile(
    //   title: new Text("${_members[i]["login"]}", style: _biggerFont)
    // );
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListTile(
        //title: new Text("${_members[i]["login"]}", style: _biggerFont),
        title: new Text("${_members[i].login}", style: _biggerFont),
        leading: CircleAvatar(
          backgroundColor: Colors.green,
          backgroundImage: NetworkImage(_members[i].avatarUrl),
        ),
        onTap: () {
          print('Pressed');
          Navigator.push(
            context,
            // MaterialPageRoute(builder: (context) => MapWidget())
            // MaterialPageRoute(builder: (context) => MapFlutterWidgetNew())
            // MaterialPageRoute(builder: (context) => CurrentLocationWidget())
            MaterialPageRoute(builder: (context) => GetLocationPage())
          );
        },
      ),
    );
  }
}