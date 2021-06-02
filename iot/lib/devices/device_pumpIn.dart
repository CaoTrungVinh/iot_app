import 'package:flutter/material.dart';
import 'package:iot/timers/pumpIn_timer.dart';

class Device_PumpIn extends StatefulWidget {
  const Device_PumpIn({Key key}) : super(key: key);

  @override
  _Device_PumpInState createState() => _Device_PumpInState();
}

class _Device_PumpInState extends State<Device_PumpIn> {
  bool isSwitchedBomIn = false;
  var textValueBomIn = 'Switch is OFF';

  void switchBomIn(bool value) {
    if (isSwitchedBomIn == false) {
      setState(() {
        isSwitchedBomIn = true;
        textValueBomIn = 'Switch Button is ON';
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitchedBomIn = false;
        textValueBomIn = 'Switch Button is OFF';
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
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PumpIn_Timer(),
                ),
              );
            },
            color: Colors.blue,
            textColor: Colors.white,
          )
        ],
      ),
    );
  }
}
