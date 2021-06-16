import 'package:flutter/material.dart';
import 'package:iot/network/get_data.dart';
import 'package:iot/network/post_data.dart';
import 'package:iot/network/present_time.dart';
import 'package:iot/timers/pump_in_timer.dart';

class Device_PumpIn extends StatefulWidget {
  const Device_PumpIn({Key key}) : super(key: key);

  @override
  _Device_PumpInState createState() => _Device_PumpInState();
}

class _Device_PumpInState extends State<Device_PumpIn> {
  bool isLoading = false;

  bool isSwitchedBomIn = false;
  int control;
  String description = '';
  var textValueBomIn = 'Switch is OFF';

  @override
  void initState() {
    super.initState();
    get_pump_in_data();
  }

  Future<void> get_pump_in_data() async {
    if (isLoading)
      return;
    isLoading = true;
    await getPumpIn().then((value) {
      if (value == null) {
        isLoading = false;
        return;
      }
      setState(() {
        if (value == 1 || value == 2){
          isSwitchedBomIn = true;
          // print(value);
        }else if (value == 0){
          isSwitchedBomIn = false;
          // print(value);
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

  Future<void> switchBomIn(bool value)  {
    if (isSwitchedBomIn == false) {
      setState(()  {
        isSwitchedBomIn = true;
        textValueBomIn = 'Switch Button is ON';
        control = 1;
        description = 'Bơm nước vào hồ nuôi cá';
         postPumpIn_On_Off(control, description, todayDate()).then((value) {
          print(value);
        });
      });
      print('Switch Button is ON');
    } else {
      setState(()  {
        isSwitchedBomIn = false;
        textValueBomIn = 'Switch Button is OFF';
        control = 0;
        description = 'Tắt máy bơm';
         postPumpIn_On_Off(control, description, todayDate()).then((value) {
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
        borderRadius: const BorderRadius.all(const Radius.circular(15.0)),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Bơm nước vào",
            style: TextStyle(
                color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 17),
          ),
          Image(
            image: AssetImage('assets/images/bomin.png'),
            width: 70,
            height: 70,
          ),
          Transform.scale(
              scale: 1.2,
              child: Switch(
                onChanged: switchBomIn,
                value: isSwitchedBomIn,
                activeColor: Colors.blue,
                activeTrackColor: Colors.lightBlueAccent,
                inactiveThumbColor: Colors.grey,
                inactiveTrackColor: Colors.grey[300],
              )),
          FlatButton(
            child: Text("Hẹn giờ"),
            onPressed: () => {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      Pump_In_Timer(),
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
