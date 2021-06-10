import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:iot/network/network.dart';

class test extends StatefulWidget {
  const test({Key key}) : super(key: key);

  @override
  _testState createState() => _testState();
}

class _testState extends State<test> {
  double temp;

  Dio dio = new Dio();

  Future postDataTemp(double min) async {
    final String paturl = url + 'storetemps';
    dynamic data = {'temperature': min};
    var response = await dio.post(paturl,
        data: data,
        options: Options(
            headers: {'Content-type': 'application/json; charset=UTF-8'}));
    return response.data;
  }

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
          'Test',
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
                image: AssetImage('assets/images/canhbao_temp.png'),
                width: 160,
                height: 160,
              ),
            ),
            Text(
              'Nhiệt độ',
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
                  temp = double.tryParse(text);
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
                    hintText: 'Giá trị khuyên dùng: 25',
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
                  temp == null
                      ? _showErro()
                      : _showDialogWarning(context, temp);
                },
                elevation: 5,
                padding: EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: Colors.blueAccent,
                child: Text('Cảnh báo',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold)),
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

  _showDialogWarning(BuildContext context, double min) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Cảnh báo nguy hiểm'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Nhiệt độ an toàn ' +
                    min.toString()),
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
                await postDataTemp(min).then((value) {
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