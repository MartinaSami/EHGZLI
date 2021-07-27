import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:provider/provider.dart';


// ignore: must_be_immutable
class ReservationInfo extends StatefulWidget {

  String restaurantName;

  @override
  _ReservationInfoState createState() => _ReservationInfoState(restaurantName);
}

class _ReservationInfoState extends State<ReservationInfo> {

  final String restaurantName;

  _ReservationInfoState(this.restaurantName);

  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Reservations '),
          backgroundColor: Color.fromRGBO(174, 27, 2, 1),
        ),
        body: StreamBuilder <QuerySnapshot> (
          stream: FirebaseFirestore.instance.collection("users").snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

            if(!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListView(

              children: snapshot.data.docs.map((document) {

                return Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 6.0),
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10.0),
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding:
                          const EdgeInsets.only(left: 5.0, top: 10.0, bottom: 10.0),
                          child: InkWell(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5.0, horizontal: 5.0),
                                  child: Text(
                                    "Restaurant: " + document['Restaurant'],
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5.0, horizontal: 5.0),
                                  child: Text(
                                    "Area: " + document['Area'],
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5.0, horizontal: 5.0),
                                  child: Text(
                                    "Number of seats: " + document['Seats'],
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5.0, horizontal: 5.0),
                                  child: Text(
                                    "Time: " + document['Time'],
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5.0, horizontal: 5.0),
                                  child: Text(
                                   "Date: " + document['Date'].toString(),
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),

                                TextButton(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 130.0, vertical: 10.0),
                                      height: 40,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(0.2),
                                              spreadRadius: 2,
                                              blurRadius: 7,
                                              offset: Offset(
                                                  0, 5), // changes position of shadow
                                            ),
                                          ],
                                          gradient: LinearGradient(colors: [
                                            Color.fromRGBO(250, 250, 250, 1),
                                            Color.fromRGBO(240, 240, 240, 1),
                                          ])),
                                      child: Text(
                                        "Delete",
                                        style: TextStyle(
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),

                                    onPressed: () {
                                      //final User craeteuserId = auth.currentUser;
                                  //    final uid = craeteuserId.uid;
                                      //var firebaseUser = FirebaseAuth.instance.currentUser;
                                      CollectionReference user = FirebaseFirestore
                                          .instance
                                          .collection('users');
                                      return user
                                          .doc(document.id)
                                          .delete()
                                          .then((value) => print("User Deleted"))
                                          .catchError((error) =>
                                          print("Failed to delete user: $error"));
                                    }),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            );

          },

        ),
      ),
    );
  }
}
