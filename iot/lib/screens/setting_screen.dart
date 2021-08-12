import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iot/authentication/changePass.dart';
import 'package:iot/authentication/update_ProfileUser.dart';
import 'package:iot/network/shared_service.dart';
import 'package:iot/screens/dieukhoan.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isSwitchedBomIn = false;
  var textValueBomIn = 'Switch is OFF';

  Future<void> switchpush(bool value) {
    if (isSwitchedBomIn == false) {
      setState(() {
        isSwitchedBomIn = true;
        textValueBomIn = 'Switch Button is ON';
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitchedBomIn = false;
        textValueBomIn = 'Switch Button is OFF';
      });
      print('Switch Button is OFF');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
      child: ListView(
        children: [
          SizedBox(
            height: 15,
          ),
          Image(
            image: AssetImage('assets/images/logo.png'),
            width: 160,
            height: 160,
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
            height: 225,
            color: Colors.white,
            child: ListView(
              children: ListTile.divideTiles(
                context: context,
                tiles: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DieuKhoan(),
                        ),
                      );
                    },
                    child: ListTile(
                      title: Text(
                        'Điều khoản và sử dụng',
                        style: TextStyle(color: Colors.black),
                      ),
                      trailing: Icon(Icons.chevron_right),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => UpdateProfileUserPage(),
                        ),
                      );
                    },
                    child: ListTile(
                      title: Text(
                        'Cập nhật thông tin',
                        style: TextStyle(color: Colors.black),
                      ),
                      trailing: Icon(Icons.chevron_right),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ChangePassPage(),
                        ),
                      );
                    },
                    child: ListTile(
                      title: Text(
                        'Đổi mật khẩu',
                        style: TextStyle(color: Colors.black),
                      ),
                      trailing: Icon(Icons.chevron_right),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _showDialogExit(context);
                    },
                    child: ListTile(
                      title: Text(
                        'Thoát',
                        style: TextStyle(color: Colors.black),
                      ),
                      trailing: Icon(Icons.chevron_right),
                    ),
                  ),
                ],
              ).toList(),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10.0, 20.0, 15.0, 0.0),
            // width: 1000,
            child: RaisedButton(
              onPressed: () {
                _showDialogLogout(context);
              },
              elevation: 5,
              padding: EdgeInsets.all(15),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              color: Colors.blueAccent,
              child: Text('ĐĂNG XUẤT',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  )),
            ),
          ),
        ],
      ),
    );
  }

  _showDialogExit(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('CV cảnh báo'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Bạn có thực sự muốn thoát'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Huỷ bỏ'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            FlatButton(
              child: Text('Thoát'),
              onPressed: () async {
                SystemNavigator.pop();
              },
            ),
          ],
        );
      },
    );
  }

  _showDialogLogout(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('CV cảnh báo'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Bạn có thực sự đăng xuất'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Huỷ bỏ'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            FlatButton(
              child: Text('Đăng xuất'),
              onPressed: () async {
                SharedService.logout(context);
              },
            ),
          ],
        );
      },
    );
  }
}
