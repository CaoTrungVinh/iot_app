import 'dart:async';
import 'package:flutter/material.dart';
import 'package:iot/model/light_model.dart';
import 'package:iot/network/request_light.dart';

class Light_Sensor extends StatefulWidget {
  const Light_Sensor({Key key}) : super(key: key);

  @override
  _Light_SensorState createState() => _Light_SensorState();
}

class _Light_SensorState extends State<Light_Sensor> {
  List<Light_Model> model_data = List();
  int light = 0;
  bool isLoading = false;
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
    await Request_Light.fetchLight().then(
      (value) {
        if (value == null) {
          isLoading = false;
          return;
        }
        setState(() {
          model_data = value;
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
    return model_data.isEmpty
        ? Center(child: CircularProgressIndicator())
        : Container(
            margin: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(const Radius.circular(15.0)),
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                light == model_data[0].light
                    ? new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image(
                            image: AssetImage('assets/images/sun.png'),
                            width: 120,
                            height: 120,
                          ),
                          Column(
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
                            ],
                          ),
                        ],
                      ),
              ],
            ),
          );
  }
}
