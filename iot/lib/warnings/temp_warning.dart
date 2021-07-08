import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iot/network/put_data.dart';

class Temp_Warning extends StatefulWidget {
  const Temp_Warning({Key key}) : super(key: key);

  @override
  _Temp_WarningState createState() => _Temp_WarningState();
}

class _Temp_WarningState extends State<Temp_Warning> {
  double min_temp;
  double max_temp;
  bool isSwitched = false;
  var textValue = 'Switch is OFF';

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'Switch Button is ON';
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'Switch Button is OFF';
      });
      print('Switch Button is OFF');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
          ),
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
                'Nhiệt độ thấp nhất',
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
                    min_temp = double.tryParse(text);
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
              Text(
                'Nhiệt độ cao nhất',
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
                    max_temp = double.tryParse(text);
                  },
                  // autofocus: true,
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 5, left: 15),
                      hintText: 'Giá trị khuyên dùng: 32',
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
                    min_temp == null || max_temp == null || min_temp > max_temp
                        ? _showErro()
                        : _showDialogWarning(context, min_temp, max_temp);
                  },
                  elevation: 5,
                  padding: EdgeInsets.all(14),
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
                Text('Nhiệt độ an toàn ' +
                    min.toString() +
                    '*C -> ' +
                    max.toString() +
                    '*C'),
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
                await setTempWarning(min, max).then((value) {
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
