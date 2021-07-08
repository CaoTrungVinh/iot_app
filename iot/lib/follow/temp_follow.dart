import 'dart:async';
import 'package:flutter/material.dart';
import 'package:iot/model/temp_model.dart';
import 'package:iot/network/put_data.dart';
import 'package:iot/network/request_temp.dart';
import 'package:iot/warnings/temp_warning.dart';

class Temp_Follow extends StatefulWidget {
  const Temp_Follow({Key key}) : super(key: key);

  @override
  _Temp_FollowState createState() => _Temp_FollowState();
}

class _Temp_FollowState extends State<Temp_Follow> {
  List<Temp_Model> model_data = List();
  bool isLoading = false;
  Timer _timer;
  bool isSwitched = false;
  int set_warning;

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        set_warning = 1;
        setTempWarning_OnOff(set_warning).then((value) {
        });
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
        set_warning = 0;
        setTempWarning_OnOff(set_warning).then((value) {
        });
      });
      print('Switch Button is OFF');
    }
  }

  void startTimer() {
    _timer = new Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        warning_data();
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

  Future<void> warning_data() async {
    if (isLoading) return;
    isLoading = true;
    await Request_Temp.fetchTemp().then(
      (value) {
        if (value == null) {
          isLoading = false;
          return;
        }
        setState(() {
          model_data = value;
          if (model_data[0].warning == 1){
            isSwitched = true;
          }else if (model_data[0].warning == 0){
            isSwitched = false;
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
        ? Container(
            child: Text(''),
          )
        : Container(
            width: 160.0,
            height: 250.0,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(const Radius.circular(15.0)),
              color: Colors.white,
            ),
            margin: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Nhiệt độ an toàn',
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    Image(
                      image: AssetImage('assets/images/canhbao_temp.png'),
                      width: 90,
                      height: 90,
                    ),
                    Text(
                        model_data[0].temperatureMin.toString() +
                            '   -->  ' +
                            model_data[0].temperatureMax.toString() +
                            ' (*C)',
                        style: TextStyle(
                          color: Colors.black54,
                        )),
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
                  ],
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  child: FlatButton(
                    child: Text("Cảnh báo"),
                    onPressed: () => {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Temp_Warning(),
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
