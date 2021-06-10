import 'package:flutter/material.dart';
import 'package:iot/network/get_data.dart';
import 'package:iot/network/post_data.dart';
import 'package:iot/network/present_time.dart';

class Device_Light extends StatefulWidget {
  const Device_Light({Key key}) : super(key: key);

  @override
  _Device_LightState createState() => _Device_LightState();
}

class _Device_LightState extends State<Device_Light> {
  bool isLoading = false;
  int control;
  String description = '';

  bool isSwitchedLamp = false;
  var textValueLamp = 'Switch is OFF';

  @override
  void initState() {
    super.initState();
    get_lamp_data();
  }

  Future<void> get_lamp_data() async {
    if (isLoading)
      return;
    isLoading = true;
    await getLamp().then((value) {
      if (value == null) {
        isLoading = false;
        return;
      }
      setState(() {
        if (value == 1 || value == 2){
          isSwitchedLamp = true;
        }else if (value == 0){
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

  void switchLamp(bool value) {
    if(isSwitchedLamp == false){
      setState(()  {
        isSwitchedLamp = true;
        textValueLamp = 'Switch Button is ON';
        control = 1;
        description = 'Bật đèn';
        postLamp_On_Off(control, description, todayDate()).then((value) {
          print(value);
        });
      });
      print('Switch Button is ON');
    }
    else {
      setState(()  {
        isSwitchedLamp = false;
        textValueLamp = 'Switch Button is OFF';
        control = 0;
        description = 'Tắt đèn';
        postLamp_On_Off(control, description, todayDate()).then((value) {
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
            "Đèn",
            style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 17),
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
                activeTrackColor: Colors.lightBlueAccent,
                inactiveThumbColor: Colors.grey,
                inactiveTrackColor: Colors.grey[300],
              )),
          FlatButton (
            child: Text("Hẹn giờ"),
            onPressed: () {},
            color: Colors.blue,
            textColor: Colors.white,
          )
        ],
      ),
    );
  }
}
