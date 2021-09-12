import 'dart:async';
import 'package:flutter/material.dart';
import 'package:iot/model/light_model.dart';
import 'package:iot/network/put_data.dart';
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

  bool isSwitched = false;
  bool Switched = false;
  int set_warning;

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        set_warning = 1;
        setLightWarning_OnOff(set_warning).then((value) {});
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
        set_warning = 0;
        setLightWarning_OnOff(set_warning).then((value) {});
      });
      print('Switch Button is OFF');
    }
  }
  void toggle(bool value) {
    if (Switched == false) {
      setState(() {
        Switched = true;
        setAutoLight(model_data[0].id, 1).then((value) {
        });
      });
      print('Button is ON');
    } else {
      setState(() {
        Switched = false;
        setAutoLight(model_data[0].id, 0).then((value) {
        });
      });
      print('Button is OFF');
    }
  }

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
          if (model_data[0].warning == 1) {
            isSwitched = true;
          } else if (model_data[0].warning == 0) {
            isSwitched = false;
          }
          if (model_data[0].auto_control == 1) {
            Switched = true;
          } else if (model_data[0].auto_control != 1) {
            Switched = false;
          }
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
                          Column(
                            children: [
                              Image(
                                image: AssetImage('assets/images/sun.png'),
                                width: 100,
                                height: 100,
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    Text(
                                      'Tự động bật đèn',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Transform.scale(
                                        scale: 1.2,
                                        child: Switch(
                                          onChanged: toggle,
                                          value: Switched,
                                          activeColor: Colors.blue,
                                          activeTrackColor: Colors.lightBlue,
                                          inactiveThumbColor: Colors.grey,
                                          inactiveTrackColor: Colors.grey[300],
                                        ))
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                child: Text(
                                  'Cảnh báo ao trời tối',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                              Container(
                                child: Transform.scale(
                                    scale: 1.2,
                                    child: Switch(
                                      onChanged: toggleSwitch,
                                      value: isSwitched,
                                      activeColor: Colors.blue,
                                      activeTrackColor: Colors.lightBlue,
                                      inactiveThumbColor: Colors.grey,
                                      inactiveTrackColor: Colors.grey[300],
                                    )),
                              ),
                              Text(model_data[0].createdAt),
                            ],
                          ),
                        ],
                      )
                    : new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Image(
                                image: AssetImage('assets/images/moon.png'),
                                width: 100,
                                height: 100,
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    Text(
                                      'Tự động bật đèn',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Transform.scale(
                                        scale: 1.2,
                                        child: Switch(
                                          onChanged: toggle,
                                          value: Switched,
                                          activeColor: Colors.blue,
                                          activeTrackColor: Colors.lightBlue,
                                          inactiveThumbColor: Colors.grey,
                                          inactiveTrackColor: Colors.grey[300],
                                        ))
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                child: Text(
                                  'Cảnh báo ao trời tối',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                              Transform.scale(
                                  scale: 1.2,
                                  child: Switch(
                                    onChanged: toggleSwitch,
                                    value: isSwitched,
                                    activeColor: Colors.blue,
                                    activeTrackColor: Colors.lightBlue,
                                    inactiveThumbColor: Colors.grey,
                                    inactiveTrackColor: Colors.grey[300],
                                  )),
                              Text(model_data[0].createdAt),
                            ],
                          ),
                        ],
                      ),
              ],
            ),
          );
  }
}
