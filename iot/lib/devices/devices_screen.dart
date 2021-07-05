import 'package:flutter/material.dart';
import 'package:iot/devices/device_lamp.dart';
import 'package:iot/devices/device_oxygen_fan.dart';
import 'package:iot/devices/device_pump_in.dart';
import 'package:iot/devices/device_pump_out.dart';

class DeviceScreen extends StatefulWidget {
  const DeviceScreen({Key key}) : super(key: key);

  @override
  _DeviceScreenState createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen> {
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
          'Điều khiển',
          style: TextStyle(fontSize: 16, color: Colors.black),
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
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 15, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Device_PumpIn(),
                Device_PumpOut(),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Device_Lamp(),
              Device_Oxy()
            ],
          ),
        ],
      ),
    ));
  }
}
