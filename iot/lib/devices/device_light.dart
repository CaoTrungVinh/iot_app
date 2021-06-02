import 'package:flutter/material.dart';

class Device_Light extends StatefulWidget {
  const Device_Light({Key key}) : super(key: key);

  @override
  _Device_LightState createState() => _Device_LightState();
}

class _Device_LightState extends State<Device_Light> {
  bool isSwitchedLight = false;
  var textValueLight = 'Switch is OFF';

  void switchLight(bool value) {
    if(isSwitchedLight == false){
      setState(() {
        isSwitchedLight = true;
        textValueLight = 'Switch Button is ON';
      });
      print('Switch Button is ON');
    }
    else {
      setState(() {
        isSwitchedLight = false;
        textValueLight = 'Switch Button is OFF';
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
                onChanged: switchLight,
                value: isSwitchedLight,
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
