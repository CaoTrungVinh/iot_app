// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
//
// Future<void> initState() async {
//   var initializationSettingsAndroid =
//   new AndroidInitializationSettings('temp_push_icon');
//   var initializationSettingsIOS = new IOSInitializationSettings();
//   var initializationSettings = new InitializationSettings(
//       initializationSettingsAndroid, initializationSettingsIOS);
//   flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
//   await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//       onSelectNotification: onSelectNotification);
// }
//
// Future<void> _showNotificationWithDefaultSound() async {
//   var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
//       'your channel id', 'your channel name', 'your channel description',
//       importance: Importance.Max, priority: Priority.High);
//   var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
//   var platformChannelSpecifics = new NotificationDetails(
//       androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
//   await flutterLocalNotificationsPlugin.show(
//     0,
//     'Cảnh báo nhiệt độ',
//     'Nhiệt độ đang ở mức không an toàn',
//     platformChannelSpecifics,
//     payload: 'Default_Sound',
//   );
// }
//
// Future onSelectNotification(String payload) async {
//   showDialog(
//     // context: await context,
//     builder: (_) {
//       return new AlertDialog(
//         title: Text("Thông báo"),
//         content: Text("Push Notification : $payload"),
//       );
//     },
//   );
// }
