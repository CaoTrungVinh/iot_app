import 'package:flutter/material.dart';
import 'package:iot/model/temp_model.dart';
import 'package:iot/network/request_temp.dart';
import 'package:iot/warnings/temp_warning.dart';

class Temp_Chart_Screen extends StatefulWidget {
  const Temp_Chart_Screen({Key key}) : super(key: key);

  @override
  _Temp_Chart_ScreenState createState() => _Temp_Chart_ScreenState();
}

class _Temp_Chart_ScreenState extends State<Temp_Chart_Screen> {
  List<Temp_Model> temp_data = List();
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Request_Temp.fetchTemp().then((dataFromServer) {
      setState(() {
        temp_data = dataFromServer;
        print(temp_data.length);
      });
    });
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
          'Nhiệt độ',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ), //style of title
        ), //title
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 490,
            child: Column(
              children: [
                Container(
                  height: 40,
                  child: Row(
                    children: [
                      Container(
                          margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Text('STT',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold))),
                      Container(
                          margin: EdgeInsets.fromLTRB(40, 0, 90, 0),
                          child: Text("Dữ liệu đo",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold))),
                      Text('Giờ đo',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                temp_data.isEmpty
                    ? Center(child: CircularProgressIndicator())
                    : Container(
                  margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  height: 450,
                  // color: Colors.white,
                  child: ListView.builder(
                      itemCount: temp_data.length,
                      itemBuilder: (context, index) {
                        int stt = index + 1;
                        String count = stt.toString();
                        return Card(
                          child: Container(
                            padding: EdgeInsets.all(16),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(count),
                                Text('${temp_data[index].temperature}'),
                                Text('${temp_data[index].createdAt}'),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
            width: 1000,
            child: RaisedButton(
              onPressed: () => {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Temp_Warning(),
                  ),
                )
              },
              elevation: 5,
              padding: EdgeInsets.all(15),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              color: Colors.blueAccent,
              child: Text('CẢNH BÁO NHIỆT ĐỘ',
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
}
