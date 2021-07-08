import 'package:flutter/material.dart';
import 'package:iot/model/oxygen_fan_model.dart';
import 'package:iot/network/present_time.dart';
import 'package:iot/network/put_data.dart';
import 'package:iot/network/request_oxygen_fan.dart';
import 'package:iot/timers/oxygen_fan_timer.dart';

class Device_Oxy extends StatefulWidget {
  const Device_Oxy({Key key}) : super(key: key);

  @override
  _Device_OxyState createState() => _Device_OxyState();
}

class _Device_OxyState extends State<Device_Oxy> {
  List<Oxygen_Fan_Model> model_data = List();
  bool isLoading = false;
  int control;
  String description = '';

  bool isSwitchedGraphic = false;
  var textValueGraphic = 'Switch is OFF';

  @override
  void initState() {
    super.initState();
    get_oxygen_fan_data();
  }

  Future<void> get_oxygen_fan_data() async {
    if (isLoading) return;
    isLoading = true;
    await Request_Oxygen_Fan.fetchOxy().then(
      (value) {
        if (value == null) {
          isLoading = false;
          return;
        }
        setState(() {
          model_data = value;
          if (model_data[0].status == 1 || model_data[0].status == 2) {
            isSwitchedGraphic = true;
          } else if (model_data[0].status == 0) {
            isSwitchedGraphic = false;
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

  void switchGraphic(bool value) {
    if (isSwitchedGraphic == false) {
      setState(() {
        isSwitchedGraphic = true;
        textValueGraphic = 'Switch Button is ON';
        control = 1;
        description = 'Bật quạt oxy';
        setOxygen_OnOff(control).then((value) {
          print(value);
        });
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitchedGraphic = false;
        textValueGraphic = 'Switch Button is OFF';
        control = 0;
        description = 'Tắt quạt oxy';
        setOxygen_OnOff(control).then((value) {
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
                  "Quạt oxy",
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),
                Image(
                  image: AssetImage('assets/images/graphic.png'),
                  width: 70,
                  height: 70,
                ),
                Transform.scale(
                    scale: 1.2,
                    child: Switch(
                      onChanged: switchGraphic,
                      value: isSwitchedGraphic,
                      activeColor: Colors.blue,
                      activeTrackColor: Colors.lightBlue,
                      inactiveThumbColor: Colors.grey,
                      inactiveTrackColor: Colors.grey[300],
                    )),
                FlatButton (
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
                            Oxygen_Fan_Timer(),
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
