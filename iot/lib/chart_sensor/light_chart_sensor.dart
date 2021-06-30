import 'package:flutter/material.dart';
import 'package:iot/model/light_model.dart';
import 'package:iot/network/request_light.dart';

class Light_Chart_Screen extends StatefulWidget {
  const Light_Chart_Screen({Key key}) : super(key: key);

  @override
  _Light_Chart_ScreenState createState() => _Light_Chart_ScreenState();
}

class _Light_Chart_ScreenState extends State<Light_Chart_Screen> {
  List<Light_Model> light_data = List();
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Request_Light.fetchLight().then((dataFromServer) {
      setState(() {
        light_data = dataFromServer;
        print(light_data.length);
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
          'Ánh sáng',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ), //style of title
        ), //title
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body:
          Column(
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
                light_data.isEmpty
                    ? Center(child: CircularProgressIndicator())
                    : Container(
                  margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  height: 510,
                  // color: Colors.white,
                  child: ListView.builder(
                      itemCount: light_data.length,
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
                                '${light_data[index].description}'
                                    .contains("Night")
                                    ? Text("Buổi tối")
                                    : Text("Buổi sáng"),
                                Text('${light_data[index].createdAt}'),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
    );
  }
}
