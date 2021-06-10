import 'package:flutter/material.dart';
import 'package:iot/network/get_data.dart';
import 'package:iot/network/post_data.dart';
import 'package:iot/network/present_time.dart';
import 'package:iot/timers/pump_out_timer.dart';

class Device_PumpOut extends StatefulWidget {
  const Device_PumpOut({Key key}) : super(key: key);

  @override
  _Device_PumpOutState createState() => _Device_PumpOutState();
}

class _Device_PumpOutState extends State<Device_PumpOut> {
  bool isLoading = false;
  int control;
  String description = '';

  bool isSwitchedBomOut = false;
  var textValueBomOut = 'Switch is OFF';

  @override
  void initState() {
    super.initState();
    get_pump_out_data();
  }

  Future<void> get_pump_out_data() async {
    if (isLoading)
      return;
    isLoading = true;
    await getPumpOut().then((value) {
      if (value == null) {
        isLoading = false;
        return;
      }
      setState(() {
        if (value == 1 || value == 2){
          isSwitchedBomOut = true;
        }else if (value == 0){
          isSwitchedBomOut = false;
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

  void switchBomOut(bool value) {
    if(isSwitchedBomOut == false){
      setState(()  {
        isSwitchedBomOut = true;
        textValueBomOut = 'Switch Button is ON';
        control = 1;
        description = 'Bơm nước hồ ra ngoài';
        postPumpOut_On_Off(control, description, todayDate()).then((value) {
          print(value);
        });
      });
      print('Switch Button is ON');
    }
    else {
      setState(()  {
        isSwitchedBomOut = false;
        textValueBomOut = 'Switch Button is OFF';
        control = 0;
        description = 'Tắt máy bơm';
        postPumpOut_On_Off(control, description, todayDate()).then((value) {
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
      margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Bơm nước ra",
            style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 17),
          ),
          Image(
            image: AssetImage('assets/images/bomout.png'),
            width: 70,
            height: 70,
          ),
          Transform.scale(
              scale: 1.2,
              child: Switch(
                onChanged: switchBomOut,
                value: isSwitchedBomOut,
                activeColor: Colors.blue,
                activeTrackColor: Colors.lightBlueAccent,
                inactiveThumbColor: Colors.grey,
                inactiveTrackColor: Colors.grey[300],
              )),
          FlatButton (
            child: Text("Hẹn giờ"),
            onPressed: () => {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      Pump_Out_Timer(),
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
