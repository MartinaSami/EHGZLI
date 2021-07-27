import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstfirebase/reservationinfo.dart';
import 'package:firstfirebase/restaurantmaps.dart';
import 'package:firstfirebase/homepage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class RestaurantsPage extends StatefulWidget {
  // constructor and user login information
  RestaurantsPage({Key key, this.user, this.restaurantName}) : super(key: key);
  final UserCredential user;
  String restaurantName;

  @override
  RestaurantsPageState createState() => RestaurantsPageState(restaurantName);
}

class RestaurantsPageState extends State<RestaurantsPage> {
  File _image;
  final picker = ImagePicker();

  getImage(ImageSource src) async {
    final pickedFile = await picker.getImage(source: src);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }else{
        print("No image selected");
      }
    });
  }

  String restaurantName;

  //declare variables names
  String spectraName = "Spectra";
  String sizzlerName = "Sizzler";
  String latinoName = "Latino";
  String pianolaName = "Pianola";
  String spectraDishes = "American - Coffee & Drinks - Desserts";
  String sizzlerDishes = "International - Steaks";
  String latinoDishes = "Grill - International - Sushi";
  String pianolaDishes = "International";
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  RestaurantsPageState(restaurantName);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Restaurants'),
          backgroundColor: Color.fromRGBO(174, 27, 2, 1),
        ),
        drawer: Container(
          child: Drawer(
            child: Column(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text('${widget.user.user.email}'),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Color.fromRGBO(174, 27, 2, 0.8),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(174, 27, 2, 0.8),
                  ),
/*
                  onDetailsPressed: () {
                    var add = AlertDialog(
                      title: Text("Select photo"),
                      content: Container(
                        height: 150,
                        child: Column(
                          children: [
                            Divider(
                              color: Colors.black,
                            ),
                            Container(
                              color: Colors.grey,
                              child: ListTile(
                                leading: Icon(Icons.image),
                                title: Text("Gallery"),
                                onTap: () {
                                  getImage(ImageSource.gallery);
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              color: Colors.grey,
                              child: ListTile(
                                leading: Icon(Icons.add_a_photo),
                                title: Text("Camera"),
                                onTap: () {
                                  getImage(ImageSource.camera);
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),

                    );

                    showDialog(context: context, child: add);
                  },*/
                ),
                ListTile(
                  title: Text('My Reservations'),
                  trailing: Icon(Icons.calendar_today),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReservationInfo(),
                      ),
                    );
                  },
                ),
                Divider(
                  thickness: 0.5,
                ),
                ListTile(
                  title: Text('Sign out'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () async {
                    await signOut();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),

        body: Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 10.0),
          child: ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 10.0, right: 10.0),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 5.0, top: 10.0, bottom: 0.0, right: 5.0),
                    child: InkWell(
                      onTap: () {
                        // going to restaurant location on Map
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RestaurantsMaps(
                                    restaurantName: spectraName)));
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(alignment: Alignment.bottomCenter, children: [
                            Ink.image(
                                height: 200,
                                image: AssetImage('assets/spectra2.jpg'),
                                fit: BoxFit.fitWidth),
                          ]),
                          Padding(
                            padding: EdgeInsets.only(left: 0, top: 0.0),
                            child: ListTile(
                              title: Text(
                                spectraName,
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                spectraDishes,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10.0, right: 10.0),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 5.0, top: 10.0, bottom: 0.0, right: 5.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RestaurantsMaps(
                                    restaurantName: sizzlerName)));
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(alignment: Alignment.bottomCenter, children: [
                            Ink.image(
                                height: 200,
                                image: AssetImage('assets/Sizzler-Logo-2.png'),
                                fit: BoxFit.fitWidth),
                          ]),
                          Padding(
                            padding: EdgeInsets.only(left: 0, top: 0.0),
                            child: ListTile(
                              title: Text(
                                sizzlerName,
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                sizzlerDishes,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10.0, right: 10.0),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 5.0, top: 10.0, bottom: 0.0, right: 5.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RestaurantsMaps(
                                    restaurantName: latinoName)));
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(alignment: Alignment.bottomCenter, children: [
                            Ink.image(
                                height: 200,
                                image: AssetImage('assets/Latino2.png'),
                                fit: BoxFit.fitWidth),
                          ]),
                          Padding(
                            padding: EdgeInsets.only(left: 0, top: 0.0),
                            child: ListTile(
                              title: Text(
                                latinoName,
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                latinoDishes,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10.0, right: 10.0),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 5.0, top: 10.0, bottom: 0.0, right: 5.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RestaurantsMaps(
                                    restaurantName: pianolaName)));
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(alignment: Alignment.bottomCenter, children: [
                            Ink.image(
                                height: 200,
                                image: AssetImage('assets/pianola2.png'),
                                fit: BoxFit.fitWidth),
                          ]),
                          Padding(
                            padding: EdgeInsets.only(left: 0, top: 0.0),
                            child: ListTile(
                              title: Text(
                                pianolaName,
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                pianolaDishes,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ), //Cards
      ),
    );
  }

// Sign out function
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    _googleSignIn.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }
}
