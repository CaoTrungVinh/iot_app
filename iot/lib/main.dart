import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iot/model/light_model.dart';
import 'package:iot/screens/nav.dart';
import 'package:iot/network/request_light.dart';
import 'package:iot/chart_sensor/temp_chart_sensor.dart';

void main() => runApp(MyApp());

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
    );
  }
}
class httprequ extends StatefulWidget {
  const httprequ({Key key}) : super(key: key);

  @override
  _httprequState createState() => _httprequState();
}

class _httprequState extends State<httprequ> {

  List<Light_Model> light_data = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Request_Light.fetchLight().then((dataFromServer){
      setState(() {
        light_data = dataFromServer;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: light_data.length,
              itemBuilder: (context, index){
              return Card(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${light_data[index].light}')
                    ],
                  ),
                ),
              );
          }))
        ],
      ),
    );
  }
}

