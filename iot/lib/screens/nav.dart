import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:iot/push_notifications/local_notification_service.dart';
import 'package:iot/screens/devices_screen.dart';
import 'package:iot/screens/sensors_screen.dart';
import 'package:iot/screens/setting_screen.dart';
import 'package:iot/screens/user_screen.dart';

class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}
class _NavState extends State<Nav> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseMessaging.instance.getToken().then((token){
        print("Token: $token");
    });

    FirebaseMessaging.instance.getInitialMessage();
    // FirebaseMessaging.instance.getInitialMessage().then((message) {
    //   if (message != null){
    //     final routerFromMessage = message.data["route"];
    //     Navigator.of(context).pushNamed(routerFromMessage);
    //   }
    // });

    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null){
        print(message.notification.body);
        print(message.notification.title);
      }
      LocalNotificationService.display(message);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
    });

  }






  int _currentIndex = 0;

  final tabs = [
    UserScreeen(),
    SensorsScreen(),
    DeviceScreen(),
    SettingScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Flutter Demo")),
      body: SafeArea(child: tabs[_currentIndex]),

      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() => _currentIndex = index),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.people),
            title: Text('User'),
            activeColor: Colors.blueAccent,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.add_to_home_screen),
            title: Text('Follow'),
            activeColor: Colors.blueAccent,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.send_to_mobile),
            title: Text('Device'),
            activeColor: Colors.blueAccent,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
            activeColor: Colors.blueAccent,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
