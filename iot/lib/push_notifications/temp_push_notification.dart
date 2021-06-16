import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:async';
import 'package:flutter/material.dart';

class a extends StatefulWidget {
  const a({Key key}) : super(key: key);

  @override
  _aState createState() => _aState();
}

class _aState extends State<a> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

Future _showNotificationWithDefaultSound() async {
  var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
      'your channel id', 'your channel name', 'your channel description',
      importance: Importance.Max, priority: Priority.High);
  var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
  var platformChannelSpecifics = new NotificationDetails(
      androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
  await flutterLocalNotificationsPlugin.show(
    0,
    'Cảnh báo nhiệt độ',
    'Nhiệt độ đang ở mức không an toàn',
    platformChannelSpecifics,
    payload: 'Default_Sound',
  );
}
