import 'package:flutter/material.dart';
import 'package:iot/model/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class UserScreeen extends StatefulWidget {
  @override
  UserClass createState() => new UserClass();
}

// const UserScreeen({Key key}) : super(key: key);
class UserClass extends State {
  final String title = 'Url Launcher';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 270,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40.0),
                bottomRight: Radius.circular(40.0)),
            color: Colors.blueAccent,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(30.0, 25.0, 0.0, 0.0),
                child: Text(
                  "HỆ THỐNG NUÔI CÁ CV",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontFamily: "Anton-Regular",
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30.0, 30.0, 0.0, 0.0),
                child: Text(
                  "Bạn có cảm thấy tốt không?",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontFamily: "Anton-Regular",
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: 300,
                margin: EdgeInsets.fromLTRB(30.0, 10.0, 0.0, 0.0),
                child: Text(
                  "Nếu cảm thấy không ổn với bất cứ điều gì hãy gọi cho chúng tôi để được giúp đỡ.",
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      fontFamily: "Anton-Regular"),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 140,
                      decoration: BoxDecoration(
                        borderRadius:
                        const BorderRadius.all(const Radius.circular(25.0)),
                        color: Color(0xff56C222),
                      ),
                      // margin: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0.0),
                      child: FlatButton(
                          child: Row(
                            children: [
                              Icon(Icons.call),
                              Text(
                                '  Gọi điện',
                                style: TextStyle(fontSize: 17.0),
                              ),
                            ],
                          ),
                          textColor: Colors.white,
                          onPressed: () {
                            Utils.openPhoneCall(phoneNumber: '0348004562');
                          }),
                    ),
                    Container(
                      width: 140,
                      decoration: BoxDecoration(
                        borderRadius:
                        const BorderRadius.all(const Radius.circular(25.0)),
                        color: Colors.redAccent,
                      ),
                      // margin: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0.0),
                      child: FlatButton(
                          child: Row(
                            children: [
                              Icon(Icons.email),
                              Text(
                                ' Gửi email',
                                style: TextStyle(fontSize: 17),
                              ),
                            ],
                          ),
                          textColor: Colors.white,
                          onPressed: () {
                            Utils.openEmail(
                              toEmail: 'example@gmail.com',
                              subject: 'Hello World',
                              body: 'This works great!',
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 15.0),
                child: Row(
                  children: [
                    Icon(Icons.account_circle),
                    Text(
                      "      " + "Cao Trung Vĩnh",
                      style: TextStyle(color: Colors.black54, fontSize: 17),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 15.0),
                child: Row(
                  children: [
                    Icon(Icons.accessibility_new_outlined),
                    Text(
                      "      " + "Nam",
                      style: TextStyle(color: Colors.black54, fontSize: 17),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 15.0),
                child: Row(
                  children: [
                    Icon(Icons.phone),
                    Text(
                      "      " + "0348004562",
                      style: TextStyle(color: Colors.black54, fontSize: 17),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 15.0),
                child: Row(
                  children: [
                    Icon(Icons.location_on_sharp),
                    Text(
                      "      " + "Thủ Đức",
                      style: TextStyle(color: Colors.black54, fontSize: 17),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}