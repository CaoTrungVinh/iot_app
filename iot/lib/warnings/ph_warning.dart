import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dio/dio.dart';
import 'dart:async';
import 'package:iot/network/network.dart';
import 'package:iot/network/post_data.dart';

class Ph_Warning extends StatefulWidget {
  const Ph_Warning({Key key}) : super(key: key);

  @override
  _Ph_WarningState createState() => _Ph_WarningState();
}

class _Ph_WarningState extends State<Ph_Warning> {
  double min_ph;
  double max_ph;

  Dio dio = new Dio();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color(0xff2E3A59),
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          'Cảnh báo nguy hiểm',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ), //style of title
        ), //title
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20.0),
              alignment: Alignment.center,
              child: Image(
                image: AssetImage('assets/images/canhbao_ph.png'),
                width: 160,
                height: 160,
              ),
            ),
            Text(
              'Nồng độ thấp nhất',
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 2))
                  ]),
              height: 55,
              child: TextField(
                onChanged: (text) {
                  min_ph = double.tryParse(text);
                },
                // autofocus: false,
                keyboardType: TextInputType.number,
                style: TextStyle(
                  color: Colors.black87,
                ),
                decoration: InputDecoration(
                  // errorText: 'sai',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 5, left: 15),
                    hintText: 'Giá trị khuyên dùng: 5.5',
                    hintStyle:
                    TextStyle(color: Colors.black12, fontSize: 14)),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Nồng độ cao nhất',
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 2))
                  ]),
              height: 55,
              child: TextField(
                onChanged: (text) {
                  max_ph = double.tryParse(text);
                },
                // autofocus: true,
                keyboardType: TextInputType.number,
                style: TextStyle(
                  color: Colors.black87,
                ),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 5, left: 15),
                    hintText: 'Giá trị khuyên dùng: 8.5',
                    hintStyle:
                    TextStyle(color: Colors.black12, fontSize: 14)),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 1000,
              child: RaisedButton(
                onPressed: () {
                  min_ph == null ||
                      max_ph == null ||
                      min_ph > max_ph
                      ? _showErro()
                      : _showDialogWarning(context, min_ph, max_ph);
                },
                elevation: 5,
                padding: EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: Colors.blueAccent,
                child: Text('CẢNH BÁO',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _showErro() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Cảnh báo nguy hiểm'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Vui lòng nhập lại'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Đồng ý'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  _showDialogWarning(BuildContext context, double min, double max) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Cảnh báo nguy hiểm'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Nồng độ an toàn ' +
                    min.toString() +
                    ' -> ' +
                    max.toString()),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Huỷ bỏ'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Đồng ý'),
              onPressed: () async {
                print('Post data');
                await postDataPhWarning(min, max).then((value) {
                  print(value);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
