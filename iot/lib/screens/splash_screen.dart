import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iot/screens/nav.dart';


class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    // Navigator.of(context).pushReplacement(
    //   MaterialPageRoute(
    //     builder: (context) => Nav(),
    //   ),
    // );
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            Nav(),
      ),
    );
  }

  initScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Container(
            //   child: Image.asset("assets/images/logo.png"),
            // ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Text(
              "CV",
              style: TextStyle(fontSize: 20.0, color: Colors.black),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            CircularProgressIndicator(
              backgroundColor: Colors.black,
              strokeWidth: 5,
            )
          ],
        ),
      ),
    );
  }
}