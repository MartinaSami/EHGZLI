import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firstfirebase/reservationpage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// ignore: must_be_immutable
class RestaurantsMaps extends StatefulWidget {
  String restaurantName;

  RestaurantsMaps({this.restaurantName});

  @override
  _RestaurantsMapsState createState() => _RestaurantsMapsState(restaurantName);
}

class _RestaurantsMapsState extends State<RestaurantsMaps> {
  GoogleMapController mapController;
  LatLng center = const LatLng(30.019016, 31.410772);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  String restaurantName;

  _RestaurantsMapsState(this.restaurantName);

  // ignore: non_constant_identifier_names
  LatLng mapSwitch() {
    LatLng center2;

    switch (restaurantName) {
      case "Spectra":
        center2 = const LatLng(30.065593, 31.22706);
        break;
      case "Sizzler":
        center2 = const LatLng(30.073182, 31.347314);
        break;
      case "Latino":
        center2 = const LatLng(30.045142, 31.218913);
        break;
      case "Pianola":
        center2 = const LatLng(29.961199, 31.248899);
        break;
      default:
    }
    return center2;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(restaurantName),
          backgroundColor: Color.fromRGBO(174, 27, 2, 1),
        ),
        body: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: mapSwitch(),
                  zoom: 20.0,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 40.0),
              child: TextButton(
                child: Container(
                  // padding: EdgeInsets.only(
                  //     left: 100.0, right: 100.0, top: 15.0),
                  padding:
                  EdgeInsets.symmetric(horizontal: 100.0, vertical: 15.0),
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(231, 12, 0, 1),
                        Color.fromRGBO(112, 12, 0, 1),
                      ])),
                  child: Text(
                    "Reserve Now",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ReservationPage("$restaurantName")));
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
