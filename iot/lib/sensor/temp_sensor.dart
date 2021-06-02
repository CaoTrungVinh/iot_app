import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iot/model/temp_model.dart';
import 'package:iot/network/request_temp.dart';
import 'package:iot/warnings/temp_warning.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Temp_Sensor extends StatefulWidget {
  const Temp_Sensor({Key key}) : super(key: key);

  @override
  _Temp_SensorState createState() => _Temp_SensorState();
}

class _Temp_SensorState extends State<Temp_Sensor> {
  Timer _timer;
  List<Temp_Model> temp_data = List();
  bool isLoading = false;

  void startTimerTemp() {
    const oneSec = const Duration(seconds: 2);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          data_temp();
        },
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    startTimerTemp();
    super.initState();
  }

  void data_temp() {
    if (isLoading) return;
    // print("data_temp");
    isLoading = true;
    Request_Temp.fetchTemp().then(
      (dataFromServer) {
        if (dataFromServer == null) {
          isLoading = false;
          return;
        }
        setState(() {
          temp_data = dataFromServer;
        });
        isLoading = false;
      },
      onError: (err) {
        isLoading = false;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return temp_data.isEmpty
        ? CircularProgressIndicator()
        : Container(
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
                    percent: double.tryParse('${temp_data.last.temp}') / 100,
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
                          '${temp_data.last.temp}',
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
                  // margin: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                  child: Row(
                    children: [
                      IconButton(
                          icon: Icon(
                            Icons.stacked_line_chart,
                            color: Colors.blue,
                          ),
                          onPressed: () => {}),
                      IconButton(
                          icon: Icon(
                            Icons.warning,
                            color: Colors.blue,
                          ),
                          onPressed: () => {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        Temp_Warning(),
                                  ),
                                )
                              }),
                    ],
                  ),
                )
              ],
            ),
          );
  }
}
