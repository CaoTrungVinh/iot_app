import 'package:flutter/material.dart';

class About_Screen extends StatefulWidget {
  const About_Screen({Key key}) : super(key: key);

  @override
  _About_ScreenState createState() => _About_ScreenState();
}

class _About_ScreenState extends State<About_Screen> {
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
          'Giới thiệu',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ), //style of title
        ), //title
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
          child: Column(
            children: [
              Image(
                image: AssetImage('assets/images/logo.png'),
                width: 160,
                height: 160,
              ),
              Text('v 000000001'),
            ],
          ),
        ),
    );
  }
}
