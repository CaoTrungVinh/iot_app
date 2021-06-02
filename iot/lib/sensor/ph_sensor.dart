import 'dart:async';
import 'package:flutter/material.dart';
import 'package:iot/model/ph_model.dart';
import 'package:iot/network/request_ph.dart';
import 'package:iot/warnings/ph_warning.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:iot/chart_sensor/ph_chart_sensor.dart';

class Ph_Sensor extends StatefulWidget {
  const Ph_Sensor({Key key}) : super(key: key);

  @override
  _Ph_SensorState createState() => _Ph_SensorState();
}

class _Ph_SensorState extends State<Ph_Sensor> {
  Timer _timer;
  List<PH_Model> ph_data = List();
  bool isLoading = false;

  void startTimerPh() {
    const oneSec = const Duration(seconds: 2);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          data_ph();
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
    startTimerPh();
    super.initState();
  }

  void data_ph() {
    if (isLoading) return;
    // print("data_ph");
    isLoading = true;
    Request_Ph.fetchPh().then(
      (dataFromServer) {
        if (dataFromServer == null) {
          isLoading = false;
          return;
        }
        setState(() {
          ph_data = dataFromServer;
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
    return ph_data.isEmpty
        ? CircularProgressIndicator()
        : Container(
            width: 160.0,
            height: 210.0,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(const Radius.circular(15.0)),
              color: Colors.white,
            ),
            child: Column(
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
                                      value: double.tryParse(
                                          '${ph_data.last.value}'),
                                      enableAnimation: true)
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
                            "Độ Ph: " + '${ph_data.last.value}',
                            style: TextStyle(
                                color: Colors.grey, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.stacked_line_chart,
                              color: Colors.blue,
                            ),
                            onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => Ph_Chart_Screen(),
                                    ),
                                  );
                                }),
                        IconButton(
                            icon: Icon(
                              Icons.warning,
                              color: Colors.blue,
                            ),
                            onPressed: (){
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Ph_Warning(),
                                ),
                              );
                            }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
