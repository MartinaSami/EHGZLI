import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'homepage.dart';

class ResetScreen extends StatefulWidget {
  @override
  _ResetScreenState createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  // declare variables of reset
  String _email;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Form(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(
                          left: 70.0, right: 70.0, top: 70, bottom: 50),
                      width: 220,
                      height: 140,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/res.png'),
                              fit: BoxFit.fill)),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(143, 148, 251, .2),
                                      blurRadius: 20.0,
                                      offset: Offset(0, 10))
                                ]),
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15.0,
                                      right: 15.0,
                                      top: 3.0,
                                      bottom: 15.0),
                                  child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: new InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Color.fromRGBO(180, 12, 1, 0.6), width: 1.0),
                                          borderRadius: new BorderRadius.circular(50.0),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Color.fromRGBO(180, 12, 1, 0.6), width: 1.0),
                                          borderRadius: new BorderRadius.circular(50.0),
                                        ),
                                        prefixIcon: Icon(
                                          Icons.verified_sharp,
                                          color:
                                          Color.fromRGBO(180, 12, 1, 0.6),
                                          size: 20,
                                        ),
                                        hintText: 'Enter your verification email',
                                        hintStyle:
                                        TextStyle(color: Colors.black26),
                                        labelText: 'Verify Email',
                                        labelStyle: TextStyle(
                                          color:
                                          Color.fromRGBO(180, 12, 1, 0.6),
                                        )),
                                    // form validation
                                    onChanged: (value) {
                                      setState(() {
                                        _email = value.trim();
                                      });
                                    },
                                    // onSaved: (input) => _email = input,
                                  ),
                                  // child: TextFormField(
                                  //   keyboardType: TextInputType.emailAddress,
                                  //   decoration: new InputDecoration(
                                  //     focusedBorder: OutlineInputBorder(
                                  //       borderSide: BorderSide(color: Color.fromRGBO(180, 12, 1, 0.6), width: 1.0),
                                  //       borderRadius: new BorderRadius.circular(50.0),
                                  //     ),
                                  //     enabledBorder: OutlineInputBorder(
                                  //       borderSide: BorderSide(color: Color.fromRGBO(180, 12, 1, 0.6), width: 1.0),
                                  //       borderRadius: new BorderRadius.circular(50.0),
                                  //     ),
                                  //     hintText: 'Enter your verification email',
                                  //   ),
                                  //   onChanged: (value) {
                                  //     setState(() {
                                  //       _email = value.trim();
                                  //     });
                                  //   },
                                  //   // onSaved: (input) => _email = input,
                                  // ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextButton(
                            onPressed: () {
                              // sending email to reset password and go to homepage
                              auth.sendPasswordResetEmail(email: _email);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
                            },
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 100.0, right: 100.0, top: 15.0),
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(colors: [
                                    Color.fromRGBO(231, 12, 0, 1),
                                    Color.fromRGBO(112, 12, 0, 1),
                                  ])),
                              child: Text(
                                "Reset ",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          RichText(
                            text: TextSpan(
                                text: 'Remembered it?!',
                                style: TextStyle(
                                    color: Color.fromRGBO(112, 12, 0, 1),
                                    fontSize: 15),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: ' Login',
                                      style: TextStyle(
                                          color: Colors.blueAccent,
                                          fontSize: 15),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HomePage()),
                                          );
                                        })
                                ]),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          RichText(
                            text: TextSpan(
                              text: 'Please notify that the email won\'t  be sent if you don\'t have an account...',
                              style: TextStyle(
                                  color: Color.fromRGBO(128,128,128, 1),
                                  fontSize: 15),

                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
