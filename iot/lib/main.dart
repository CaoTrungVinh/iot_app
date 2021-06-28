import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iot/authentication/Welcome/welcome_screen.dart';
import 'package:iot/push_notifications/local_notification_service.dart';
import 'package:iot/screens/nav.dart';

Future<void> backgroundHandler(RemoteMessage message) {
  print(message.data.toString());
  print(message.notification.title);
  print(message.notification.body);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalNotificationService.initialize();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, // navigation bar color
      statusBarColor: Colors.transparent, // status bar color
      statusBarIconBrightness: Brightness.dark, // status bar icons' color
      systemNavigationBarIconBrightness:
      Brightness.dark, //navigation bar icons' color
    ));
    return MaterialApp(
      home: Nav(),
      debugShowCheckedModeBanner: false,
    );
  }
}