import 'package:flutter/material.dart';

class Device_PumpOut extends StatefulWidget {
  const Device_PumpOut({Key key}) : super(key: key);

  @override
  _Device_PumpOutState createState() => _Device_PumpOutState();
}

class _Device_PumpOutState extends State<Device_PumpOut> {
  bool isSwitchedBomOut = false;
  var textValueBomOut = 'Switch is OFF';

  void switchBomOut(bool value) {
    if(isSwitchedBomOut == false){
      setState(() {
        isSwitchedBomOut = true;
        textValueBomOut = 'Switch Button is ON';
      });
      print('Switch Button is ON');
    }
    else {
      setState(() {
        isSwitchedBomOut = false;
        textValueBomOut = 'Switch Button is OFF';
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
            onPressed: () {},
            color: Colors.blue,
            textColor: Colors.white,
          )
        ],
      ),
    );
  }
}
