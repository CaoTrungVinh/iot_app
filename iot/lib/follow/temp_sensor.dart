import 'dart:async';
import 'package:iot/chart_sensor/temp_chart_sensor.dart';
import 'package:iot/network/get_data.dart';
import 'package:iot/network/network.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:dio/dio.dart';

class Temp_Sensor extends StatefulWidget {
  const Temp_Sensor({Key key}) : super(key: key);

  @override
  _Temp_SensorState createState() => _Temp_SensorState();
}

class _Temp_SensorState extends State<Temp_Sensor> {
  Dio dio = new Dio();
  bool isLoading = false;
  double data;
  Timer _timer;


  void startTimer() {
    _timer = new Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        temp_data();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  Future<void> temp_data() async {
    if (isLoading)
      return;
    isLoading = true;
    await getDataTempLast().then((value) {
      if (value == null) {
        isLoading = false;
        return;
      }
      setState(() {
        data = double.tryParse(value.toString());
      });
      isLoading = false;
    },
      onError: (err) {
        // print(err);
        isLoading = false;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return data == null
        ?
    Container(child: Text(''),)
        : Container(
      margin: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(const Radius.circular(15.0)),
              color: Colors.white,
            ),
            height: 210.0,
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  height: 140.0,
                  width: 140.0,
                  child: CircularPercentIndicator(
                    radius: 135.0,
                    lineWidth: 13.0,
                    animation: true,
                    percent: data / 100,
                    center: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        new Text(
                          "Nhiệt độ",
                          style: new TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey),
                        ),
                        new Text(
                          data.toString(),
                          style: new TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30.0),
                        ),
                      ],
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: Colors.redAccent,
                  ),
                ),
                Container(
                  child: FlatButton (
                    child: Text("Chi tiết"),
                    onPressed: () => {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              test(),
                        ),
                      )
                    },
                    color: Colors.blue,
                    textColor: Colors.white,
                  ),
                )
              ],
            ),
          );
  }
}
