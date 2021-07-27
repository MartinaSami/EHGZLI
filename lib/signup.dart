import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firstfirebase/restaurantpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firstfirebase/homepage.dart';

class SignUp extends StatefulWidget {
  @override
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  // declare variables and form key
  String _email;

  String username, phoneNumber;

  //TextController to read text entered in text field
  final TextEditingController _password = TextEditingController();

  TextEditingController confirmPassword = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(
                          left: 70.0, right: 70.0, top: 30, bottom: 30),
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
                                      left: 15.0, right: 15.0, bottom: 15.0),
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    decoration: new InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromRGBO(
                                                  180, 12, 1, 0.6),
                                              width: 1.0),
                                          borderRadius:
                                              new BorderRadius.circular(50.0),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromRGBO(
                                                  180, 12, 1, 0.6),
                                              width: 1.0),
                                          borderRadius:
                                              new BorderRadius.circular(50.0),
                                        ),
                                        prefixIcon: Icon(
                                          Icons.person,
                                          color:
                                              Color.fromRGBO(180, 12, 1, 0.6),
                                          size: 20,
                                        ),
                                        hintText: 'Enter Your Username',
                                        hintStyle:
                                            TextStyle(color: Colors.black26),
                                        labelText: 'Username',
                                        labelStyle: TextStyle(
                                          color:
                                              Color.fromRGBO(180, 12, 1, 0.6),
                                        )),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'please Enter a Username';
                                      }
                                      return null;
                                    },
                                    onSaved: (input) => username = input,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15.0, right: 15.0, bottom: 15.0),
                                  child: TextFormField(
                                    keyboardType: TextInputType.phone,
                                    decoration: new InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromRGBO(
                                                  180, 12, 1, 0.6),
                                              width: 1.0),
                                          borderRadius:
                                              new BorderRadius.circular(50.0),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromRGBO(
                                                  180, 12, 1, 0.6),
                                              width: 1.0),
                                          borderRadius:
                                              new BorderRadius.circular(50.0),
                                        ),
                                        prefixIcon: Icon(
                                          Icons.phone,
                                          color:
                                              Color.fromRGBO(180, 12, 1, 0.6),
                                          size: 20,
                                        ),
                                        hintText: 'Enter Your Phone Number',
                                        hintStyle:
                                            TextStyle(color: Colors.black26),
                                        labelText: 'Phone Number',
                                        labelStyle: TextStyle(
                                          color:
                                              Color.fromRGBO(180, 12, 1, 0.6),
                                        )),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please Enter a Phone Number';
                                      }
                                      return null;
                                    },
                                    onSaved: (input) => phoneNumber = input,
                                  ),
                                ),
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
                                          borderSide: BorderSide(
                                              color: Color.fromRGBO(
                                                  180, 12, 1, 0.6),
                                              width: 1.0),
                                          borderRadius:
                                              new BorderRadius.circular(50.0),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromRGBO(
                                                  180, 12, 1, 0.6),
                                              width: 1.0),
                                          borderRadius:
                                              new BorderRadius.circular(50.0),
                                        ),
                                        prefixIcon: Icon(
                                          Icons.mail,
                                          color:
                                              Color.fromRGBO(180, 12, 1, 0.6),
                                          size: 20,
                                        ),
                                        hintText: 'Enter Your Email',
                                        hintStyle:
                                            TextStyle(color: Colors.black26),
                                        labelText: 'Email',
                                        labelStyle: TextStyle(
                                          color:
                                              Color.fromRGBO(180, 12, 1, 0.6),
                                        )),
                                    // form validation
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please Enter Your Email';
                                      }
                                      if (!RegExp(
                                              "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                          .hasMatch(value)) {
                                        return 'Invalid Email';
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      _email = value;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15.0, right: 15.0, bottom: 15.0),
                                  child: TextFormField(
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: true,
                                    decoration: new InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromRGBO(
                                                  180, 12, 1, 0.6),
                                              width: 1.0),
                                          borderRadius:
                                              new BorderRadius.circular(50.0),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromRGBO(
                                                  180, 12, 1, 0.6),
                                              width: 1.0),
                                          borderRadius:
                                              new BorderRadius.circular(50.0),
                                        ),
                                        prefixIcon: Icon(
                                          Icons.lock,
                                          color:
                                              Color.fromRGBO(180, 12, 1, 0.6),
                                          size: 20,
                                        ),
                                        hintText: 'Enter Your Password',
                                        hintStyle:
                                            TextStyle(color: Colors.black26),
                                        labelText: 'Password',
                                        labelStyle: TextStyle(
                                          color:
                                              Color.fromRGBO(180, 12, 1, 0.6),
                                        )),
                                    controller: _password,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please Enter a Password';
                                      }
                                      return null;
                                    },
                                    onSaved: (value) => _password.text = value,
                                  ),
                                ),
                                // check  match password

                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15.0, right: 15.0, bottom: 15.0),
                                  child: TextFormField(
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: true,
                                    decoration: new InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                Color.fromRGBO(180, 12, 1, 0.6),
                                            width: 1.0),
                                        borderRadius:
                                            new BorderRadius.circular(50.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                Color.fromRGBO(180, 12, 1, 0.6),
                                            width: 1.0),
                                        borderRadius:
                                            new BorderRadius.circular(50.0),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.lock,
                                        color: Color.fromRGBO(180, 12, 1, 0.6),
                                        size: 20,
                                      ),
                                      hintText: 'Enter Your Match Password',
                                      hintStyle:
                                          TextStyle(color: Colors.black26),
                                      labelText: 'Match Password',
                                      labelStyle: TextStyle(
                                        color: Color.fromRGBO(180, 12, 1, 0.6),
                                      ),
                                    ),
                                    controller: confirmPassword,
                                    validator: (String value) {
                                      if (value.isEmpty) {
                                        return 'Please re-enter Match Password';
                                      }

                                      if (value != _password.text) {
                                        return "Password does\'t Match";
                                      }

                                      return null;
                                    },
                                    onSaved: (value) => confirmPassword.text = value,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          // ignore: deprecated_member_use
                          FlatButton(
                            textColor: Colors.white,
                            // calling Sign up function
                            onPressed: signUp,
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
                                "Register",
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
                                text: 'Already have an account?!',
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
                          Container(
                            margin: const EdgeInsets.only(top: 10, bottom: 0),
                            width: MediaQuery.of(context).size.width,
                            height: 100,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/footer.png'),
                                    fit: BoxFit.fill)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }

// Sign up function

  Future<void> signUp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();

      try {
        //final User craeteuserid = auth.currentUser;
        // final uid = craeteuserid.uid;
        UserCredential user = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: _email, password: _password.text);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => RestaurantsPage(
                      user: user,
                    )));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          // set up the buttons
          // ignore: deprecated_member_use
          Widget cancelButton = FlatButton(
            child: Text("Cancel"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          );
          // ignore: deprecated_member_use
          Widget continueButton = FlatButton(
            child: Text("Ok"),
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
          );

          // set up the AlertDialog
          AlertDialog alert = AlertDialog(
            title: Text("Alert"),
            content: Text(
                "Account already exist! Would you like to go to login page ?"),
            actions: [
              cancelButton,
              continueButton,
            ],
          );

          // show the dialog
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return alert;
            },
          );
        }
      } catch (e) {
        print(e);
      }
    }
  }
}
