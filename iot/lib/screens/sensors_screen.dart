import 'package:flutter/material.dart';
import 'package:iot/sensor/light_sensor.dart';
import 'package:iot/sensor/ph_sensor.dart';
import 'package:iot/sensor/temp_sensor.dart';

class SensorsScreen extends StatefulWidget {
  const SensorsScreen({Key key}) : super(key: key);

  @override
  SensorsClass createState() => new SensorsClass();
}

class SensorsClass extends State<SensorsScreen> {
  int light = 1;
  String valueTemp;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Temp_Sensor(),
            Ph_Sensor(),
          ],
        ),
        Light_Sensor(),
      ],
    );
  }
}
