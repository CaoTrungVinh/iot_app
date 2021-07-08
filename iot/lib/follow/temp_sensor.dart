import 'dart:async';
import 'package:flutter/material.dart';
import 'package:iot/model/temp_model.dart';
import 'package:iot/network/request_temp.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Temp_Sensor extends StatefulWidget {
  const Temp_Sensor({Key key}) : super(key: key);

  @override
  _Temp_SensorState createState() => _Temp_SensorState();
}

class _Temp_SensorState extends State<Temp_Sensor> {
  List<Temp_Model> model_data = List();
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
    if (isLoading) return;
    isLoading = true;
    await Request_Temp.fetchTemp().then(
      (dataFromServer) {
        if (dataFromServer == null) {
          isLoading = false;
          return;
        }
        setState(() {
          model_data = dataFromServer;
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
    return model_data.isEmpty
        ? Text('')
        : Container(
            margin: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(const Radius.circular(15.0)),
              color: Colors.white,
            ),
            height: 170.0,
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 140.0,
              width: 140.0,
              child: CircularPercentIndicator(
                radius: 135.0,
                lineWidth: 13.0,
                animation: true,
                percent: model_data[0].temperature / 100,
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
                      model_data[0].temperature.toString(),
                      style: new TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30.0),
                    ),
                  ],
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Colors.redAccent,
              ),
            ),
          );
  }
}
