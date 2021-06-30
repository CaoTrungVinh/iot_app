import 'package:flutter/material.dart';
import 'package:iot/model/ph_model.dart';
import 'package:iot/network/request_ph.dart';
import 'package:iot/warnings/ph_warning.dart';

class Ph_Chart_Screen extends StatefulWidget {
  const Ph_Chart_Screen({Key key}) : super(key: key);

  @override
  _Ph_Chart_ScreenState createState() => _Ph_Chart_ScreenState();
}

class _Ph_Chart_ScreenState extends State<Ph_Chart_Screen> {
  List<PH_Model> ph_data = List();
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Request_Ph.fetchPh().then((dataFromServer) {
      setState(() {
        ph_data = dataFromServer;
        print(ph_data.length);
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
          'Độ Ph',
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
                ph_data.isEmpty
                    ? Center(child: CircularProgressIndicator())
                    : Container(
                        margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                        height: 450,
                        // color: Colors.white,
                        child: ListView.builder(
                            itemCount: ph_data.length,
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
                                      Text('${ph_data[index].value}'),
                                      Text('${ph_data[index].createdAt}'),
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
                    builder: (context) => Ph_Warning(),
                  ),
                )
              },
              elevation: 5,
              padding: EdgeInsets.all(15),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              color: Colors.blueAccent,
              child: Text('CẢNH BÁO ĐỘ PH',
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
