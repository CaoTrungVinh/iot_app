import 'package:flutter/material.dart';
import 'package:iot/model/lamp_model.dart';
import 'package:iot/network/put_data.dart';
import 'package:iot/network/request_lamp.dart';
import 'package:iot/timers/lamp_timer.dart';

class Device_Lamp extends StatefulWidget {
  const Device_Lamp({Key key}) : super(key: key);

  @override
  _Device_LampState createState() => _Device_LampState();
}

class _Device_LampState extends State<Device_Lamp> {
  List<Lamp_Model> model_data = List();
  bool isLoading = false;
  bool isSwitchedLamp = false;
  int control;
  String description = '';
  var textValueLamp = 'Switch is OFF';

  @override
  void initState() {
    super.initState();
    get_lamp_data();
  }

  Future<void> get_lamp_data() async {
    if (isLoading) return;
    isLoading = true;
    await Request_Lamp.fetchLamp().then(
          (value) {
        if (value == null) {
          isLoading = false;
          return;
        }
        setState(() {
          model_data = value;
          if (model_data[0].status == 1 || model_data[0].status == 2){
            isSwitchedLamp = true;
          }else if (model_data[0].status == 0){
            isSwitchedLamp = false;
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

  Future<void> switchLamp(bool value) {
    if (isSwitchedLamp == false) {
      setState(() {
        isSwitchedLamp = true;
        textValueLamp = 'Switch Button is ON';
        control = 1;
        description = 'Bật đèn';
        setLamp_OnOff(control).then((value) {
          print(value);
        });
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitchedLamp = false;
        textValueLamp = 'Switch Button is OFF';
        control = 0;
        description = 'Tắt đèn';
        setLamp_OnOff(control).then((value) {
          print(value);
        });
      });
      print('Switch Button is OFF');
    }
  }

  @override
  Widget build(BuildContext context) {
    return model_data.isEmpty
        ? Text('')
        : Container(
      width: 160.0,
      height: 220.0,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(const Radius.circular(15.0)),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Đèn",
            style: TextStyle(
                color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 17),
          ),
          Image(
            image: AssetImage('assets/images/light.png'),
            width: 70,
            height: 70,
          ),
          Transform.scale(
              scale: 1.2,
              child: Switch(
                onChanged: switchLamp,
                value: isSwitchedLamp,
                activeColor: Colors.blue,
                activeTrackColor: Colors.lightBlue,
                inactiveThumbColor: Colors.grey,
                inactiveTrackColor: Colors.grey[300],
              )),
          FlatButton(
            child: model_data[0].status == 2
                ? Text(
              "Hẹn giờ",
              style: TextStyle(color: Colors.white),
            )
                : Text(
              "Hẹn giờ",
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () => {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      Lamp_Timer(),
                ),
              )
            },
            color: model_data[0].status == 2 ? Colors.blue : Colors.grey[350],
            textColor: Colors.white,
          )
        ],
      ),
    );
  }
}
