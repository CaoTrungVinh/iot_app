import 'package:flutter/material.dart';
import 'package:iot/follow/sensors_screen.dart';
import 'package:iot/follow/temp_sensor.dart';

class Toolkit_Warning extends StatefulWidget {
  const Toolkit_Warning({Key key}) : super(key: key);

  @override
  _Toolkit_WarningState createState() => _Toolkit_WarningState();
}

class _Toolkit_WarningState extends State<Toolkit_Warning> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  // color: Color(0xff2E3A59),
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
            title: Text(
              'Theo dõi',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            // backgroundColor: Colors.blueAccent,
            centerTitle: true,
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
            ),
            bottom: TabBar(
              // isScrollable: true,
              tabs: [
                Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Text(
                    'Chỉ số đo',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                Text(
                  'Cảnh báo',
                  style: TextStyle(fontSize: 17),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              SensorsScreen(),
              Container()
            ],
          ),
        ),
      ),
    );
  }
}
