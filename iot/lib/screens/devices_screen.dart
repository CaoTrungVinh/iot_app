import 'package:flutter/material.dart';
import 'package:iot/chart_sensor//temp_chart_sensor.dart';
import 'package:iot/devices/device_lamp.dart';
import 'package:iot/devices/device_oxygen_fan.dart';
import 'package:iot/devices/device_pump_in.dart';
import 'package:iot/devices/device_pump_out.dart';

class DeviceScreen extends StatefulWidget {
  @override
  DeviceClass createState() => new DeviceClass();
}

// const DeviceScreen({Key key}) : super(key: key);
class DeviceClass extends State {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Device_PumpIn(),
            Device_PumpOut(),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Device_Light(),
            Device_Oxy(),
          ],
        ),
      ],
    );
  }
}
