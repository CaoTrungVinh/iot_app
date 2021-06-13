import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserScreeen extends StatefulWidget {
  @override
  UserClass createState() => new UserClass();
}

// const UserScreeen({Key key}) : super(key: key);
class UserClass extends State {
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
                  "Are you feeling good?",
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
                  "If you don't feel okay with anything, please call us immediately for help.",
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      fontFamily: "Anton-Regular"),
                ),
              ),
              Center(
                child: Container(
                  width: 160,
                  decoration: BoxDecoration(
                    borderRadius:
                    const BorderRadius.all(const Radius.circular(25.0)),
                    color: Colors.redAccent,
                  ),
                  margin: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                  child: FlatButton(
                    child: Row(
                      children: [
                        Icon(Icons.call),
                        Text(
                          '  Call Now',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ],
                    ),
                    textColor: Colors.white,
                    onPressed: () {},
                  ),
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
                    Text("      " + "Cao Trung Vĩnh", style: TextStyle(color: Colors.black54, fontSize: 17),),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 15.0),
                child: Row(
                  children: [
                    Icon(Icons.accessibility_new_outlined),
                    Text("      " + "Nam", style: TextStyle(color: Colors.black54, fontSize: 17),),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 15.0),
                child: Row(
                  children: [
                    Icon(Icons.phone),
                    Text("      " + "0348004562", style: TextStyle(color: Colors.black54, fontSize: 17),),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 15.0),
                child: Row(
                  children: [
                    Icon(Icons.location_on_sharp),
                    Text("      " + "Thủ Đức", style: TextStyle(color: Colors.black54, fontSize: 17),),
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