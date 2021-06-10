import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iot/model/light_model.dart';
import 'package:iot/screens/nav.dart';
import 'package:iot/network/request_light.dart';

import 'package:http/http.dart' as http;

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
    Request_Light.fetchLight().then((dataFromServer) {
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
          Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: light_data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [Text('${light_data[index].light}')],
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}

class abc extends StatefulWidget {
  const abc({Key key}) : super(key: key);

  @override
  _abcState createState() => _abcState();
}

class _abcState extends State<abc> {
  Dio dio = new Dio();
  Map<String, dynamic> dataModel;
  String mockData;
  double temp_min, temp_max;

  Future postData() async {
    final String paturl = 'http://192.168.1.144/iot/public/api/warningtemp';
    dynamic data = {'temp_min': 5, 'temp_max': 10.5};
    var response = await dio.post(paturl,
        data: data,
        options: Options(
            headers: {'Content-type': 'application/json; charset=UTF-8'}));
    setState(() {
      mockData = response.toString();
    });
    return response.data;
  }

  Future decodeData() async {
    final Map parsedData = await json.decode(mockData);
    print(parsedData['temp_min']);
    print(parsedData['temp_max']);
    setState(() {
      temp_min = double.tryParse(parsedData['temp_min'].toString());
      temp_max = double.tryParse(parsedData['temp_max'].toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            MaterialButton(
              onPressed: () async {
                print('Post data');
                await postData().then((value) {}).whenComplete(() async {
                  await decodeData();
                });
              },
              child: Text('dô'),
            ),
            Text('data $temp_min and $temp_max')
          ],
        ),
      ),
    );
  }
}

class getget extends StatefulWidget {
  const getget({Key key}) : super(key: key);

  @override
  _getgetState createState() => _getgetState();
}

class _getgetState extends State<getget> {
  Dio dio = new Dio();

  Future getData() async {
    final String pathUrl = 'http://192.168.1.144/iot/public/api/dataphlast';
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions option) async {
      var headers = {
        'Content-type': 'application/json; charset=UTF-8',
        'Accept': 'application/json'
      };
      option.headers.addAll(headers);
      return option.data;
    }));
    Response response = await dio.get(pathUrl);
    return response.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          onPressed: () async {
            print('get data');
            await getData().then((value) {
              print(value);
            });
          },
          child: Text('get'),
        ),
      ),
    );
  }
}
