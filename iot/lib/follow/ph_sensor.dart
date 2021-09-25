import 'dart:async';
import 'package:flutter/material.dart';
import 'package:iot/model/ph_model.dart';
import 'package:iot/network/put_data.dart';
import 'package:iot/network/request_ph.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'dart:convert';

class Ph_Sensor extends StatefulWidget {
  const Ph_Sensor({Key key}) : super(key: key);

  @override
  _Ph_SensorState createState() => _Ph_SensorState();
}

class _Ph_SensorState extends State<Ph_Sensor> {
  List<PH_Model> model_data = List();
  bool isLoading = false;
  Timer _timer;
  bool isSwitched = false;

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        setAutoPh(model_data[0].id, 1).then((value) {
        });
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
        setAutoPh(model_data[0].id, 0).then((value) {
        });
      });
      print('Switch Button is OFF');
    }
  }

  void startTimer() {
    _timer = new Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        ph_data();
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

  Future<void> ph_data() async {
    if (isLoading)
      return;
    isLoading = true;
    await Request_Ph.fetchPh().then((dataFromServer) {
      if (dataFromServer == null) {
        isLoading = false;
        return;
      }
      setState(() {
        model_data = dataFromServer;
        if (model_data[0].value == null){
          model_data[0].value = 0;
        }
        if (model_data[0].auto_control == 1) {
          isSwitched = true;
        } else if (model_data[0].auto_control != 1) {
          isSwitched = false;
        }
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
        ? Container(child: Text(''),)
        : Container(
      margin: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      width: 160.0,
      height: 260.0,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(const Radius.circular(15.0)),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: Stack(
              children: [
                Container(
                  height: 150.0,
                  padding: const EdgeInsets.all(10.0),
                  child: SfRadialGauge(
                    axes: [
                      RadialAxis(
                          minimum: 0,
                          maximum: 14,
                          interval: 2,
                          ranges: <GaugeRange>[
                            GaugeRange(
                                startValue: 0,
                                endValue: 1,
                                color: Color(0xffF31F27)),
                            GaugeRange(
                                startValue: 1,
                                endValue: 2,
                                color: Color(0xffDE5E21)),
                            GaugeRange(
                                startValue: 2,
                                endValue: 3,
                                color: Color(0xffFFCC0F)),
                            GaugeRange(
                                startValue: 3,
                                endValue: 4,
                                color: Color(0xffFDF41D)),
                            GaugeRange(
                                startValue: 4,
                                endValue: 5,
                                color: Color(0xffBCDB35)),
                            GaugeRange(
                                startValue: 5,
                                endValue: 6,
                                color: Color(0xff8ACC45)),
                            GaugeRange(
                                startValue: 6,
                                endValue: 7,
                                color: Color(0xff51C04A)),
                            GaugeRange(
                                startValue: 7,
                                endValue: 8,
                                color: Color(0xff35B14F)),
                            GaugeRange(
                                startValue: 8,
                                endValue: 9,
                                color: Color(0xff24BC71)),
                            GaugeRange(
                                startValue: 9,
                                endValue: 10,
                                color: Color(0xff08C0BE)),
                            GaugeRange(
                                startValue: 10,
                                endValue: 11,
                                color: Color(0xff4896D7)),
                            GaugeRange(
                                startValue: 11,
                                endValue: 12,
                                color: Color(0xff3B57AB)),
                            GaugeRange(
                                startValue: 12,
                                endValue: 13,
                                color: Color(0xff5D55AB)),
                            GaugeRange(
                                startValue: 13,
                                endValue: 14,
                                color: Color(0xff4A308B)),
                          ],
                          pointers: <GaugePointer>[
                            NeedlePointer(
                                value: model_data[0].value, enableAnimation: true)
                          ],
                          annotations: <GaugeAnnotation>[
                            // GaugeAnnotation(
                            //     widget: Text(
                            //       "Độ Ph: " + '${ph_data.last.value}',
                            //       style: TextStyle(
                            //           color: Colors.grey,
                            //           fontWeight: FontWeight.bold),
                            //     ),
                            //     positionFactor: 1,
                            //     angle: 90)
                          ])
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0.0, 130.0, 0.0, 0.0),
                  child: Center(
                    child: Text(
                      "Độ Ph: " + model_data[0].value.toString(),
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          model_data[0].createdAt.isEmpty ? Text("") : Text(model_data[0].createdAt),
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Column(
              children: [
                Text(
                  'Tự động bơm xả nước',
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}