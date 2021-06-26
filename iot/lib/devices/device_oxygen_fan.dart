import 'package:flutter/material.dart';
import 'package:iot/network/get_data.dart';
import 'package:iot/network/post_data.dart';
import 'package:iot/network/present_time.dart';
import 'package:iot/timers/oxygen_fan_timer.dart';

class Device_Oxy extends StatefulWidget {
  const Device_Oxy({Key key}) : super(key: key);

  @override
  _Device_OxyState createState() => _Device_OxyState();
}

class _Device_OxyState extends State<Device_Oxy> {
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
    if (isLoading)
      return;
    isLoading = true;
    await get_oxygen_fan().then((value) {
      if (value == null) {
        isLoading = false;
        return;
      }
      setState(() {
        if (value == 1 || value == 2){
          isSwitchedGraphic = true;
        }else if (value == 0){
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
    if(isSwitchedGraphic == false){
      setState(()  {
        isSwitchedGraphic = true;
        textValueGraphic = 'Switch Button is ON';
        control = 1;
        description = 'Bật quạt oxy';
        postOxygen_fan_On_Off(control, description, todayDate()).then((value) {
          print(value);
        });
      });
      print('Switch Button is ON');
    }
    else {
      setState(()  {
        isSwitchedGraphic = false;
        textValueGraphic = 'Switch Button is OFF';
        control = 0;
        description = 'Tắt quạt oxy';
        postOxygen_fan_On_Off(control, description, todayDate()).then((value) {
          print(value);
        });
      });
      print('Switch Button is OFF');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.0,
      height: 220.0,
      decoration: BoxDecoration(
        borderRadius:
        const BorderRadius.all(const Radius.circular(15.0)),
        color: Colors.white,
      ),
      margin: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
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
            child: Text("Hẹn giờ"),
            onPressed: () => {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                  Oxygen_Fan_Timer(),
                ),
              )
            },
            color: Colors.blue,
            textColor: Colors.white,
          )
        ],
      ),
    );
  }
}
