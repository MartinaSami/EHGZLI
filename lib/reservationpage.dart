import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firstfirebase/reservationinfo.dart';

// ignore: must_be_immutable
class ReservationPage extends StatefulWidget {
  String restaurantName;

  ReservationPage(
    this.restaurantName,
  );

  final String title = "DropDown Demo";

  @override
  ReservationPageState createState() => ReservationPageState(restaurantName);
}

class ReservationPageState extends State<ReservationPage> {
  String pickedDate;
  TimeOfDay time;

  String restaurantName;

  ReservationPageState(this.restaurantName);

  var re = DateTime.now().toString();
  String seatsChoose;
  String areaChoose;
  List seatsNumber = ["1", "2", "3", "4", "5"];
  List area = ["Smoking", "Non smoking", "Outdoor", "Kids area"];

  @override
  void initState() {
    super.initState();
    pickedDate = DateTime.parse(re).toString();
    time = TimeOfDay.now();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(restaurantName + " Reservation"),
          backgroundColor: Color.fromRGBO(174, 27, 2, 1),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                //Select Seats Number
                Container(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 10),
                    child: Text("Select your seats number :"),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: DropdownButton(
                        hint: Text("Select seats"),
                        icon: Icon(Icons.arrow_drop_down, size: 30),
                        isExpanded: true,
                        underline: SizedBox(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                        value: seatsChoose,
                        onChanged: (newValue) {
                          setState(() {
                            seatsChoose = newValue;
                          });
                        },
                        items: seatsNumber.map((valueItem) {
                          return DropdownMenuItem(
                            value: valueItem,
                            child: Text(valueItem),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),

                // Select Area
                Container(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 10),
                    child: Text("Select your area :"),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: DropdownButton(
                        hint: Text("Select area"),
                        icon: Icon(Icons.arrow_drop_down, size: 30),
                        isExpanded: true,
                        underline: SizedBox(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                        value: areaChoose,
                        onChanged: (newValue) {
                          setState(() {
                            areaChoose = newValue;
                          });
                        },
                        items: area.map((valueItem) {
                          return DropdownMenuItem(
                            value: valueItem,
                            child: Text(valueItem),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),

                //Date and time
                Container(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 10),
                    child: Text("Select date and time : "),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 0.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        title: Text(
                          "Date: $pickedDate",
                          style: TextStyle(color: Colors.black54),
                        ),
                        trailing: Icon(
                          Icons.arrow_drop_down,
                          size: 30,
                        ),
                        onTap: _pickDate,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 0.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        title: Text(
                          "Time: ${time.hour}:${time.minute}",
                          style: TextStyle(color: Colors.black54),
                        ),
                        trailing: Icon(
                          Icons.arrow_drop_down,
                          size: 30,
                        ),
                        onTap: _pickTime,
                      ),
                    ),
                  ),
                ),

                //Reservation Button
                Container(
                  margin: EdgeInsets.symmetric(vertical: 40.0),
                  child: TextButton(
                      child: Container(
                        // padding: EdgeInsets.only(
                        //     left: 100.0, right: 100.0, top: 15.0),
                        padding: EdgeInsets.symmetric(
                            horizontal: 50.0, vertical: 15.0),
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(colors: [
                              Color.fromRGBO(231, 12, 0, 1),
                              Color.fromRGBO(112, 12, 0, 1),
                            ])),
                        child: Text(
                          "Confirm Reservation",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      onPressed: () {
                        reserve();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ReservationInfo()));
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _pickDate() async {
    DateTime date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(DateTime.now().year),
        lastDate: DateTime(DateTime.now().year + 1));

    if (date != null) {
      setState(() {
        pickedDate = date.toString().toString();
      });
    }
  }

  _pickTime() async {
    TimeOfDay t = await showTimePicker(
      context: context,
      initialTime: time,
    );
    if (t != null) {
      setState(() {
        time = t;
      });
    }
  }

  // ignore: missing_return
  Future<void> reserve() {

    /*
    var firebaseUser = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance.collection("users").doc(firebaseUser.uid).set({
      'Seats': seatsChoose,
      'Area': areaChoose,
      'Date': pickedDate,
      'Time': time.format(context),
      'Restaurant': restaurantName,
    }).then((_) {
      print("success!");
    });
  }
*/
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    if ( areaChoose == null || seatsChoose == "") {


    }

    else
      return users
          .add({
        'Seats': seatsChoose,
        'Area': areaChoose,
        'Date': pickedDate,
        'Time': time.format(context),
        'Restaurant': restaurantName,
      })
          .then((value) => print("Reservation Done"))
          .catchError((error) => print("Failed Reservation: $error"));
    }
  }
