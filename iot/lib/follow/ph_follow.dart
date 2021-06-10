import 'dart:async';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:iot/network/get_data.dart';
import 'package:iot/warnings/ph_warning.dart';
import 'package:iot/network/network.dart';

class Ph_Follow extends StatefulWidget {
  const Ph_Follow({Key key}) : super(key: key);

  @override
  _Ph_FollowState createState() => _Ph_FollowState();
}

class _Ph_FollowState extends State<Ph_Follow> {
  Dio dio = new Dio();
  bool isLoading = false;
  Timer _timer;
  String min_ph = '';
  String max_ph = '';

  void startTimer() {
    _timer = new Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        warning_data();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  Future<void> warning_data() async {
    if (isLoading) return;
    isLoading = true;
    await getDataPhSafeLast().then(
          (value) {
        if (value == null) {
          isLoading = false;
          return;
        }
        setState(() {
          List<String> output = value.split("-");
          min_ph = output[0].trim();
          max_ph = output[1].trim();
          // print(min_ph);
          // print(max_ph);
        });
        isLoading = false;
      },
      onError: (err) {
        // print(err);
        isLoading = false;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return min_ph.isEmpty || max_ph.isEmpty
        ? Container(child: Text(''),)
        : Container(
      width: 160.0,
      height: 210.0,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(const Radius.circular(15.0)),
        color: Colors.white,
      ),
      margin: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Ph an toàn',
                style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              Image(
                image: AssetImage('assets/images/canhbao_ph.png'),
                width: 90,
                height: 90,
              ),
              Text(min_ph + '  -->  ' + max_ph,
                  style: TextStyle(
                    color: Colors.black54,)),
            ],
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
            child: FlatButton (
              child: Text("Cảnh báo"),
              onPressed: () => {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        Ph_Warning(),
                  ),
                )
              },
              color: Colors.blue,
              textColor: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
