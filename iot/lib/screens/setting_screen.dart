import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iot/setting/notification_ph.dart';
import 'package:iot/setting/notification_temp.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isSwitchedBomIn = false;
  var textValueBomIn = 'Switch is OFF';

  Future<void> switchpush(bool value) {
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
      margin: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
      child: ListView(
        children: [
          Image(
            image: AssetImage('assets/images/logo.png'),
            width: 160,
            height: 160,
          ),
          Container(
            height: 300,
            // color: Colors.white70,
            child: ListView(
              children: ListTile.divideTiles(
                context: context,
                tiles: [
                  Setting_Notification_Temp(),
                  Setting_Notification_Ph(),
                ],
              ).toList(),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10.0, 0.0, 15.0, 0.0),
            // width: 1000,
            child: RaisedButton(
              onPressed: () {},
              elevation: 5,
              padding: EdgeInsets.all(15),
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              color: Colors.blueAccent,
              child: Text('ĐĂNG XUẤT',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
