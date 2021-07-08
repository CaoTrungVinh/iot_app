import 'package:flutter/material.dart';
import 'package:iot/model/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserScreeen extends StatefulWidget {
  const UserScreeen({Key key}) : super(key: key);

  @override
  UserClass createState() => UserClass();
}

class UserClass extends State<UserScreeen> {
  final String title = 'Url Launcher';
  String name = "", email = "", birthday ="", gender = "", address ="";
  int phone = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProfileUser();
  }

  Future<void> getProfileUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      setState(() {
        email = prefs.getString("email");
        name = prefs.getString("name");
        birthday = prefs.getString("birthday");
        gender = prefs.getString("gender");
        address = prefs.getString("address");
        phone = prefs.getInt("phone");
        print(name);
      });
    } catch (error) {}
  }

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
                              borderRadius: const BorderRadius.all(
                                  const Radius.circular(25.0)),
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
                                  Utils.openPhoneCall(
                                      phoneNumber: '0348004562');
                                }),
                          ),
                          Container(
                            width: 140,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                  const Radius.circular(25.0)),
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
                          Icon(Icons.email),
                          Text(
                            "      " + email.toString(),
                            style:
                                TextStyle(color: Colors.black54, fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 15.0),
                      child: Row(
                        children: [
                          Icon(Icons.account_circle),
                          Text(
                            "      " + name.toString(),
                            style:
                                TextStyle(color: Colors.black54, fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 15.0),
                      child: Row(
                        children: [
                          Icon(Icons.wallet_giftcard_outlined),
                          Text(
                            "      " + birthday.toString(),
                            style:
                                TextStyle(color: Colors.black54, fontSize: 17),
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
                            "      " + gender.toString(),
                            style:
                                TextStyle(color: Colors.black54, fontSize: 17),
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
                            "      " + '${phone}',
                            style:
                                TextStyle(color: Colors.black54, fontSize: 17),
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
                            "      " + address.toString(),
                            style:
                                TextStyle(color: Colors.black54, fontSize: 17),
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
