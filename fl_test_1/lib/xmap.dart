import 'package:flutter/material.dart';

import 'package:latlong/latlong.dart';

import 'package:map_native/map_native.dart';

import 'package:flutter_map/flutter_map.dart';

class PageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}

class MapFlutterWidgetNew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Map"),
      ),
      body: MapFlutterWidget(),
    );
  }
}

class MapFlutterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new FlutterMap(
      options: new MapOptions(
        center: new LatLng(51.5, -0.09),
        zoom: 13.0,
      ),
      layers: [
        new TileLayerOptions(
          urlTemplate: "https://api.tiles.mapbox.com/v4/"
              "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
          additionalOptions: {
            'accessToken': 'pk.eyJ1IjoibWFyY29odW0iLCJhIjoiY2p1OGRlaWdrMDY2dDQzcGV1ZDBpdmsxdCJ9.6Sb-WKJHHOdWjI5z0B9ilA',
            'id': 'mapbox.streets',
          },
        ),
        new MarkerLayerOptions(
          markers: [
            new Marker(
              width: 80.0,
              height: 80.0,
              point: new LatLng(51.5, -0.09),
              builder: (ctx) =>
              new Container(
                child: new FlutterLogo(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class MapNativeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final inline0 = new Card(
        child: new Stack(
      children: [
        new MapView(
            initialLocation: const LatLong(35.68, 51.41),
            inititialZoom: 9.0),
        new Align(
            alignment: Alignment.bottomRight,
            child: new Padding(
                padding: const EdgeInsets.all(16.0),
                child: new FloatingActionButton(
                    backgroundColor: Colors.white,
                    onPressed: () {},
                    child: new Icon(Icons.my_location, color: Colors.purple))))
      ],
    ));

    final inline1 = new Card(
        child: new Stack(
      children: [
        new MapView(
            initialLocation: const LatLong(48.8566, 2.3522),
            inititialZoom: 9.0),
        new Align(
            alignment: Alignment.bottomRight,
            child: new Padding(
                padding: const EdgeInsets.all(16.0),
                child: new FloatingActionButton(
                    backgroundColor: Colors.white,
                    onPressed: () {},
                    child: new Icon(Icons.my_location, color: Colors.purple))))
      ],
    ));

    return new MaterialApp(
        title: 'MapView Demo',
        theme: new ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: new Scaffold(
            appBar: new AppBar(
              title: const Text("MapView Demo"),
            ),
            body: new Column(children: [
              new Padding(
                  padding: const EdgeInsets.all(4.0),
                  child:
                      new AspectRatio(child: inline0, aspectRatio: 16.0 / 9.0)),
              new Padding(
                  padding: const EdgeInsets.all(4.0),
                  child:
                      new AspectRatio(child: inline1, aspectRatio: 16.0 / 9.0)),
            ])));
  }
}