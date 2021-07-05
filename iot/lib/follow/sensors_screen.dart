import 'package:flutter/material.dart';
import 'package:iot/follow//light_sensor.dart';
import 'package:iot/follow/ph_follow.dart';
import 'package:iot/follow/ph_sensor.dart';
import 'package:iot/follow/temp_follow.dart';
import 'package:iot/follow/temp_sensor.dart';

class SensorsScreen extends StatefulWidget {
  const SensorsScreen({Key key}) : super(key: key);

  @override
  SensorsClass createState() => new SensorsClass();
}

class SensorsClass extends State<SensorsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Color(0xff2E3A59),
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: Text(
            'Theo dõi',
            style: TextStyle(
              fontSize: 16, color: Colors.black
            ),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Light_Sensor(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Temp_Sensor(),
                  Ph_Sensor(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Temp_Follow(),
                  Ph_Follow(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
