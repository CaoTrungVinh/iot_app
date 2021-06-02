import 'package:flutter/material.dart';

class Device_Oxy extends StatefulWidget {
  const Device_Oxy({Key key}) : super(key: key);

  @override
  _Device_OxyState createState() => _Device_OxyState();
}

class _Device_OxyState extends State<Device_Oxy> {
  bool isSwitchedGraphic = false;
  var textValueGraphic = 'Switch is OFF';

  void switchGraphic(bool value) {
    if(isSwitchedGraphic == false){
      setState(() {
        isSwitchedGraphic = true;
        textValueGraphic = 'Switch Button is ON';
      });
      print('Switch Button is ON');
    }
    else {
      setState(() {
        isSwitchedGraphic = false;
        textValueGraphic = 'Switch Button is OFF';
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
