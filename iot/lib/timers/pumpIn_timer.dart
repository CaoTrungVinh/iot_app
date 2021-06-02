import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PumpIn_Timer extends StatelessWidget {
  const PumpIn_Timer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PumpIn(),
    );
  }
}

class PumpIn extends StatefulWidget {
  const PumpIn({Key key}) : super(key: key);

  @override
  _PumpInState createState() => _PumpInState();
}

class _PumpInState extends State<PumpIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(0xff2E3A59),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Hẹn giờ',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ), //style of title
        ), //title
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
