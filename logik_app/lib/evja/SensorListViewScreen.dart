
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:logik_app/graphql/EvjaClient.dart';

class SensorListVievScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sensor List')),
      body: BodyLayout(),
    );
  }

}

class BodyLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // return _myListView(context);
    return _projectT(context);
  }

}

Widget _myListView(BuildContext context) {

  // backing data
  final europeanCountries = ['Albania', 'Andorra', 'Armenia', 'Austria',
  'Azerbaijan', 'Belarus', 'Belgium', 'Bosnia and Herzegovina', 'Bulgaria',
  'Croatia', 'Cyprus', 'Czech Republic', 'Denmark', 'Estonia', 'Finland',
  'France', 'Georgia', 'Germany', 'Greece', 'Hungary', 'Iceland', 'Ireland',
  'Italy', 'Kazakhstan', 'Kosovo', 'Latvia', 'Liechtenstein', 'Lithuania',
  'Luxembourg', 'Macedonia', 'Malta', 'Moldova', 'Monaco', 'Montenegro',
  'Netherlands', 'Norway', 'Poland', 'Portugal', 'Romania', 'Russia',
  'San Marino', 'Serbia', 'Slovakia', 'Slovenia', 'Spain', 'Sweden',
  'Switzerland', 'Turkey', 'Ukraine', 'United Kingdom', 'Vatican City'];

  return ListView.builder(
    itemCount: europeanCountries.length,
    itemBuilder: (context, index) {
      return ListTile(
        title: Text(europeanCountries[index]),
      );
    },
  );

}

// future builder
Widget _projectT(BuildContext context) {

  EvjaClient ec = EvjaClient();
  ec.init();

  return FutureBuilder(
    future: ec.simpleQuery(),
    builder: (context, projectSnap) {
      print(projectSnap.connectionState);
      if (projectSnap.connectionState != ConnectionState.done && projectSnap.hasData == false) {
        print("Loading");
        return SpinKitRotatingCircle(
          color: Colors.white,
          size: 50.0,
        );
        // return Container();
      }
      if (projectSnap.connectionState == ConnectionState.done && projectSnap.hasData == true) {
        return ListView.builder(
          itemCount: projectSnap.data.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(projectSnap.data[index]['name']),
            );
          }
        );
      } else {
        return Container(
          child: ListTile(
            title: Text("No Items"),
          ),
        );
      }
    },
  );
}