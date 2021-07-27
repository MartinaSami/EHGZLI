import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firstfirebase/homepage.dart';

//import 'package:shared_preferences/shared_preferences.dart';
// class of data
class Data {
  final String title;
  final String description;
  final String image;

//constructor
  Data({
    @required this.title,
    @required this.description,
    @required this.image,
  });
}

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  //declare PageController that will control page index and state
  final PageController _controller = PageController(
    initialPage: 0,
  );

  int currentIndex = 0;

  // list of data
  final List<Data> myData = [
    Data(
        title: "Enjoy Your Outing",
        description: "Easily finding your favourite restaurants",
        image: "assets/boarding1.jpg"),
    Data(
        title: "Enjoy Your Outing",
        description: "Reach there by using GPS",
        image: "assets/boarding2.jpg"),
    Data(
        title: "Enjoy Your Outing",
        description: "Reserve your seat and order in seconds",
        image: "assets/boarding3.jpg"),
  ];

/*
  @override

  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 3), (timer) {
      if (currentIndex <3) currentIndex++;
      _controller.animateToPage(
        currentIndex,
        duration: Duration(microseconds: 400),
        curve: Curves.easeIn,
      );


    });
  }
*/
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      /*
      routes: {
        '/HomePage': (ctx) => HomePage(),
      },*/
      home: Scaffold(
        body: Stack(
          children: [
            Builder(
              builder: (ctx) => PageView(
                controller: _controller,
                children: myData
                    .map((item) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: ExactAssetImage(item.image),
                        fit: BoxFit.cover),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 100.0),
                        child: Text(
                          item.title,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        item.description,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        // textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ))
                    .toList(),
                onPageChanged: (val) {
                  setState(() {
                    currentIndex = val;
                    //if (currentIndex == 2) Navigator.of(ctx).pushNamed('/HomePage');
                  });
                },
              ),
            ),
            Indicator(currentIndex),
            Builder(
              builder: (ctx) => Align(
                alignment: Alignment(0, 0.95),
                child: RaisedButton(
                  padding: EdgeInsets.all(8.0),
                  color: Colors.white70,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Color.fromRGBO(112, 12, 0, 1),)
                  ),
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 12, 0, 1),
                        fontWeight: FontWeight.normal,
                        fontSize: 22),
                  ),
                  onPressed: () {
                    //going to homepage
                    Navigator.pushReplacement(
                      context,
                      new MaterialPageRoute(
                        builder: (context) => new HomePage(),
                      ),
                    );
                    /* SharedPreferences preferences = await SharedPreferences.getInstance();
                    preferences.setBool('key', true);*/
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  //declare index of page
  final int index;

  Indicator(this.index);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0, 0.8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //changing color of index due to current page
          buildContainer(
              index == 0 ? Color.fromRGBO(112, 12, 0, 1) : Colors.white),
          buildContainer(
              index == 1 ? Color.fromRGBO(112, 12, 0, 1) : Colors.white),
          buildContainer(
              index == 2 ? Color.fromRGBO(112, 12, 0, 1) : Colors.white),
        ],
      ),
    );
  }

// three circle
  Container buildContainer(Color color) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 10,
      width: 15,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
