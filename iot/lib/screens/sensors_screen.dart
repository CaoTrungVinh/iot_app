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
    return SingleChildScrollView(
      child: Column(
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          Light_Sensor(),
          //   ],
          // ),
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
    );
  }
}
