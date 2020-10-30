import 'dart:async';
import 'package:flutter/material.dart';
import 'Home.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StartState();
  }
}

class StartState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    statTimer();
  }

  statTimer() async {
    var duration = Duration(seconds: 4);
    return Timer(duration, route);
  }

  route() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) =>homepage() ),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 20)),
            Text(
              "SPLASH SCREEN",
              style: TextStyle(fontSize: 24.0, color: Colors.blue),
            ),
            Padding(padding: EdgeInsets.only(top: 40.0)),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 1,
            )
          ],
        ),
      ),
    );
  }
}


