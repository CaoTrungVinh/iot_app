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
  String light = '0';
  Timer _timer;
  bool isLoading = false;
  List<Light_Model> light_data = List();

  void startTimerLight() {
    _timer = new Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        data_light();
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
    startTimerLight();
  }

  void data_light() {
    if (isLoading) return;
    // print("data_light");
    isLoading = true;
    Request_Light.fetchLight().then(
      (dataFromServer) {
        if (dataFromServer == null) {
          // print("data1");
          isLoading = false;
          return;
        }
        setState(() {
          light_data = dataFromServer;
          // print("data");
        });
        isLoading = false;
      },
      onError: (err) {
        print(err);
        isLoading = false;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return light_data.isEmpty
        ? CircularProgressIndicator()
        : Container(
            width: 160.0,
            height: 210.0,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(const Radius.circular(15.0)),
              color: Colors.white,
            ),
            margin: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                light.contains('${light_data.last.light}')
                    ? new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Buổi sáng',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                          Image(
                            image: AssetImage('assets/images/sun.png'),
                            width: 120,
                            height: 120,
                          ),
                        ],
                      )
                    : new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Buổi tối",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                          Image(
                            image: AssetImage('assets/images/moon.png'),
                            width: 120,
                            height: 120,
                          ),
                        ],
                      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.stacked_line_chart,
                          color: Colors.blue,
                        ),
                        onPressed: () => {}),
                    IconButton(
                        icon: Icon(
                          Icons.notifications_active,
                          color: Colors.blue,
                        ),
                        onPressed: () => {}),
                  ],
                ),
              ],
            ),
          );
  }
}
