import 'dart:async';
import 'package:flutter/material.dart';
import 'package:iot/chart_sensor/light_chart_sensor.dart';
import 'package:iot/chart_sensor/temp_chart_sensor.dart';
import 'package:iot/network/get_data.dart';
import 'package:iot/network/network.dart';
import 'package:dio/dio.dart';

class Light_Sensor extends StatefulWidget {
  const Light_Sensor({Key key}) : super(key: key);

  @override
  _Light_SensorState createState() => _Light_SensorState();
}

class _Light_SensorState extends State<Light_Sensor> {
  int light = 0;
  Dio dio = new Dio();
  bool isLoading = false;
  double data;
  Timer _timer;

  void startTimer() {
    _timer = new Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        light_data();
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

  Future<void> light_data() async {
    if (isLoading) return;
    isLoading = true;
    await getDataLightLast().then(
      (value) {
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
        ? Center(child: CircularProgressIndicator())
        : Container(
        margin: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
              width: double.infinity,
            // width: 160.0,
            // height: 210.0,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(const Radius.circular(15.0)),
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                light == data
                    ? new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image(
                            image: AssetImage('assets/images/sun.png'),
                            width: 120,
                            height: 120,
                          ),
                          Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 30,
                                child: Text(
                                  'Buổi sáng',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                              FlatButton (
                                child: Text("Chi tiết"),
                                onPressed: () => {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          Light_Chart_Screen(),
                                    ),
                                  )
                                },
                                color: Colors.blue,
                                textColor: Colors.white,
                              ),
                            ],
                          ),
                        ],
                      )
                    : new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image(
                            image: AssetImage('assets/images/moon.png'),
                            width: 120,
                            height: 120,
                          ),
                          Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 30,
                                child: Text(
                                  'Buổi tối',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                              FlatButton (
                                child: Text("Chi tiết"),
                                onPressed: () => {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          Light_Chart_Screen(),
                                    ),
                                  )
                                },
                                color: Colors.blue,
                                textColor: Colors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
              ],
            ),
          );
  }
}
