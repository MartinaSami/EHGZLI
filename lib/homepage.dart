import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firstfirebase/restaurantpage.dart';
import 'package:firstfirebase/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firstfirebase/resetpassword.dart';

//import 'package:google_sign_in/google_sign_in.dart';
class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  // initialize variables and form key
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
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
                                      left: 15.0, right: 15.0, bottom: 15.0),
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
                                        hintText: 'Enter your email',
                                        hintStyle:
                                            TextStyle(color: Colors.black26),
                                        labelText: 'Email',
                                        labelStyle: TextStyle(
                                          color:
                                              Color.fromRGBO(180, 12, 1, 0.6),
                                        )),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter your email';
                                      }
                                      if (!RegExp(
                                              "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                          .hasMatch(value)) {
                                        return 'Invalid email';
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
                                        hintText: 'Enter your password',
                                        hintStyle:
                                            TextStyle(color: Colors.black26),
                                        labelText: 'Password',
                                        labelStyle: TextStyle(
                                          color:
                                              Color.fromRGBO(180, 12, 1, 0.6),
                                        )),
                                    // check validate if text field is empty
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Incorrect password';
                                      }
                                      return null;
                                    },
                                    // to save password
                                    onSaved: (input) => _password = input,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextButton(
                            onPressed: signIn,
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
                                "Sign In",
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
                                text: 'Forgot Password?',
                                style: TextStyle(
                                    color: Color.fromRGBO(112, 12, 0, 1),
                                    fontSize: 15),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ResetScreen()),
                                    );
                                  }),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          RichText(
                            text: TextSpan(
                                text: 'Don\'t have an account?!',
                                style: TextStyle(
                                    color: Color.fromRGBO(112, 12, 0, 1),
                                    fontSize: 15),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: ' Sign up',
                                      style: TextStyle(
                                          color: Colors.blueAccent,
                                          fontSize: 15),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          // to go to signUp page
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => SignUp()),
                                          );
                                        })
                                ]),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 40, bottom: 0),
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

  //  login to firebase Function
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signIn() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        UserCredential user =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email,
          password: _password,
        );
        final User craeteuserId = auth.currentUser;
        final uid = craeteuserId.uid;
        formState.validate();
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => RestaurantsPage(user: user)));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          Widget continueButton = TextButton(
            child: Text("Ok"),
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => SignUp()));
            },
          );
          Widget cancelButton = TextButton(
            child: Text("Cancel"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          );
          // set up the AlertDialog
          AlertDialog alert = AlertDialog(
            title: Text("Alert"),
            content: Text("User not found ! Sign up now?!"),
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
        } else if (e.code == 'wrong-password') {
          Widget continueButton = TextButton(
            child: Text("Ok"),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => ResetScreen()));
            },
          );
          Widget cancelButton = TextButton(
            child: Text("Cancel"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          );
          // set up the AlertDialog
          AlertDialog alert = AlertDialog(
            title: Text("Alert"),
            content:
                Text("Wrong Password! Would you like to reset your password"),
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
