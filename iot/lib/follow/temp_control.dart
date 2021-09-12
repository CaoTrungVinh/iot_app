import 'package:flutter/material.dart';
import 'package:iot/model/temp_model.dart';
import 'package:iot/network/put_data.dart';
import 'package:iot/network/request_temp.dart';

class Temp_Control extends StatefulWidget {
  const Temp_Control({Key key}) : super(key: key);

  @override
  _Temp_ControlState createState() => _Temp_ControlState();
}

class _Temp_ControlState extends State<Temp_Control> {
  List<Temp_Model> model_data = List();
  bool isLoading = false;
  bool isSwitched = false;

  @override
  void initState() {
    super.initState();
    temp_data();
  }

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        setAutoTemp(model_data[0].id, 1).then((value) {});
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
        setAutoTemp(model_data[0].id, 0).then((value) {});
      });
      print('Switch Button is OFF');
    }
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
    // model_data.isEmpty
    //     ? Text('')
    //     :
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
          );
  }
}
