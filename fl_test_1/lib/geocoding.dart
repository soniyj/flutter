// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:geolocator/geolocator.dart';

// import './placeholder_widget.dart';

// class CurrentLocationWidget extends StatefulWidget {
//   @override
//   _LocationState createState() => _LocationState();
// }

// class _LocationState extends State<CurrentLocationWidget> {
//   Position _position;

//   @override
//   void initState() {
//     super.initState();
//     _initPlatformState();
//   }

//   // Platform messages are asynchronous, so we initialize in an async method.
//   Future<void> _initPlatformState() async {
//     Position position;
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     try {
//       final Geolocator geolocator = Geolocator()
//         ..forceAndroidLocationManager = true;
//       position = await geolocator.getCurrentPosition(
//           desiredAccuracy: LocationAccuracy.bestForNavigation);
//     } on PlatformException {
//       position = null;
//     }

//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) {
//       return;
//     }

//     setState(() {
//       _position = position;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<GeolocationStatus>(
//       future: Geolocator().checkGeolocationPermissionStatus(),
//       builder:
//           (BuildContext context, AsyncSnapshot<GeolocationStatus> snapshot) {
//         if (!snapshot.hasData) {
//           return const Center(child: CircularProgressIndicator());
//         }

//         if (snapshot.data == GeolocationStatus.disabled) {
//           return const PlaceholderWidget('Location services disabled', 'Enable location services for this App using the device settings.');
//         }

//         if (snapshot.data == GeolocationStatus.denied) {
//           return const PlaceholderWidget('Access to location denied', 'Allow access to the location services for this App using the device settings.');
//         }

//         return PlaceholderWidget('Current location:', _position.toString());
//       }
//     );
//   }

// }

import 'package:flutter/material.dart';
import 'package:location/location.dart';

class GetLocationPage extends StatefulWidget {
  @override
  _GetLocationPageState createState() => _GetLocationPageState();
}

class _GetLocationPageState extends State<GetLocationPage> {
  
  Location location = Location();

  // Map<String, double> userLocation;
  LocationData userLocation;

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('Crazy Location'),
  //     ),
  //     body: Text('data'),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            userLocation == null
                ? CircularProgressIndicator()
                : Text("Location:" +
                    // userLocation["latitude"].toString() +
                    userLocation.latitude.toString() + 
                    " " +
                    // userLocation["longitude"].toString()),
                    userLocation.longitude.toString()),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  _getLocation().then((value) {
                    setState(() {
                      userLocation = value;
                    });
                  });
                },
                color: Colors.blue,
                child: Text("Get Location", style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Future<Map<String, double>> _getLocation() async {
  Future<LocationData> _getLocation() async {
    // var currentLocation = <String, double>{};
    // var currentLocation = LocationData;
    LocationData currentLocation;
    try {
      currentLocation = await location.getLocation();
    } catch (e) {
      currentLocation = null;
    }
    return currentLocation;
  }

}