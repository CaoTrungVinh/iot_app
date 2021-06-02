import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Temp_Warning extends StatefulWidget {
  const Temp_Warning({Key key}) : super(key: key);

  @override
  _Temp_WarningState createState() => _Temp_WarningState();
}

class _Temp_WarningState extends State<Temp_Warning> {
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
          }
        ),
        title: Text(
          'Cảnh báo bất ổn',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ), //style of title
        ), //title
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            Container(
              alignment: Alignment.center,
              child: Image(
                image: AssetImage('assets/images/canhbao_temp.png'),
                width: 200,
                height: 200,
              ),
            ),
            Text('Nhiệt độ thấp nhất', style: TextStyle(color: Colors.black54, fontSize: 16, fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0,2)
                  )
                ]
              ),
              height: 55,
              child: TextField(
                keyboardType: TextInputType.number,
                style: TextStyle(
                  color: Colors.black87,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 5, left: 15),
                  hintText: 'Giá trị khuyên dùng: 20',
                  hintStyle: TextStyle(
                    color: Colors.black12, fontSize: 14
                  )
                ),
              ),
            ),
            SizedBox(height: 30,),
            Text('Nhiệt độ cao nhất', style: TextStyle(color: Colors.black54, fontSize: 16, fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0,2)
                  )
                ]
              ),
              height: 55,
              child: TextField(
                keyboardType: TextInputType.number,
                style: TextStyle(
                  color: Colors.black87,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 5, left: 15),
                  hintText: 'Giá trị khuyên dùng: 40',
                  hintStyle: TextStyle(
                    color: Colors.black12, fontSize: 14
                  )
                ),
              ),
            ),
            SizedBox(height: 30,),
            Container(
              width: 1000,
              child: RaisedButton(onPressed: () => print(''),
                elevation: 5,
                padding: EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
                ),
                color: Colors.blue,
                child: Text(
                  'Submit', style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold)
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
