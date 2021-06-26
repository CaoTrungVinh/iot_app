import 'package:flutter/material.dart';
import 'package:iot/network/get_data.dart';
import 'package:iot/network/put_data.dart';

class Setting_Notification_Ph extends StatefulWidget {
  const Setting_Notification_Ph({Key key}) : super(key: key);

  @override
  _Setting_Notification_PhState createState() => _Setting_Notification_PhState();
}

class _Setting_Notification_PhState extends State<Setting_Notification_Ph> {
  bool isLoading = false;
  int control;
  bool isSwitchedWarning = false;
  var textValueWarning = 'Switch is OFF';

  @override
  void initState() {
    super.initState();
    get_warning();
  }

  Future<void> get_warning() async {
    if (isLoading)
      return;
    isLoading = true;
    await get_notification_ph().then((value) {
      if (value == null) {
        isLoading = false;
        return;
      }
      setState(() {
        if (value == 1){
          isSwitchedWarning = true;
          // print(value);
        }else if (value == 2){
          isSwitchedWarning = false;
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

  Future<void> set_warning(bool value)  {
    if (isSwitchedWarning == false) {
      setState(()  {
        isSwitchedWarning = true;
        textValueWarning = 'Switch Button is ON';
        control = 1;
        set_warning_ph(control).then((value) {
          print(value);
        });
      });
      print('Switch Button is ON');
    } else {
      setState(()  {
        isSwitchedWarning = false;
        textValueWarning = 'Switch Button is OFF';
        control = 2;
        set_warning_ph(control).then((value) {
          print(value);
        });
      });
      print('Switch Button is OFF');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Cảnh báo độ Ph',
        style: TextStyle(color: Colors.black),
      ),
      trailing: Transform.scale(
          scale: 1.1,
          child: Switch(
            onChanged: set_warning,
            value: isSwitchedWarning,
            activeColor: Colors.blue,
            activeTrackColor: Colors.lightBlue,
            inactiveThumbColor: Colors.grey,
            inactiveTrackColor: Colors.grey[300],
          )),
    );
  }
}
