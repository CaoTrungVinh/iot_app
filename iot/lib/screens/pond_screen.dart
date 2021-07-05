import 'package:flutter/material.dart';
import 'package:iot/devices/devices_screen.dart';
import 'package:iot/follow/sensors_screen.dart';
import 'package:iot/model/control_model.dart';
import 'package:iot/model/pond_model.dart';
import 'package:iot/model/toolkit_model.dart';
import 'package:iot/network/request_control.dart';
import 'package:iot/network/request_pond.dart';
import 'package:iot/network/request_toolkit.dart';
import 'package:iot/network/shared_service.dart';

class PondScreen extends StatefulWidget {
  const PondScreen({Key key}) : super(key: key);

  @override
  _PondScreenState createState() => _PondScreenState();
}

class _PondScreenState extends State<PondScreen> {
  List<Pond_Model> pond_data = List();
  List<Toolkit_Model> toolkit_data = List();
  List<Control_Model> control_data = List();
  bool isLoading = false;
  int pond_id;
  String pond_string = '';

  @override
  void initState() {
    Pond_String();
    // TODO: implement initState
    super.initState();
    Request_Pond.fetchPond().then((dataFromServer) {
      setState(() {
        pond_data = dataFromServer;
        print(pond_data.length);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            // color: Colors.blue,
            child: Stack(
              children: [
                Container(
                  height: 180,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(20.0)),
                    color: Colors.white,
                  ),
                  child: Image(
                    image: AssetImage('assets/images/anh.png'),
                    // fit: BoxFit.contain,
                  ),
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(.05),
                            offset: Offset(0, 0),
                            blurRadius: 20,
                            spreadRadius: 3)
                      ],
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(25.0)),
                      color: Colors.white,
                    ),
                    margin: EdgeInsets.only(top: 100),
                    width: MediaQuery.of(context).size.width - 70,
                    height: 150,
                    alignment: Alignment.bottomCenter,
                    child: pond_data.isEmpty
                        ? Center(child: CircularProgressIndicator())
                        : Container(
                            padding: EdgeInsets.all(10),
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: pond_data.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        pond_id = pond_data[index].id;
                                        pond_string =
                                            '${pond_data[index].name}';
                                        Request_Toolkit.fetchToolkit(pond_id)
                                            .then((data) {
                                          setState(() {
                                            toolkit_data = data;
                                            print(toolkit_data.length);
                                          });
                                        });

                                        Request_Control.fetchControl(pond_id)
                                            .then((data) {
                                          setState(() {
                                            control_data = data;
                                            print(control_data.length);
                                          });
                                        });
                                      });
                                      print('ao nuôi số: ' + '$pond_id');
                                      print('ao nuôi số: ' + pond_string);
                                    },
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 4, vertical: 10.0),
                                      width: 120,
                                      child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          color: Color(0xFFDAE8FF),
                                          child: Center(
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    '${pond_data[index].name}',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Color(0xFF478CFF),
                                                        fontSize: 16),
                                                  ),
                                                  Text(
                                                    '${pond_data[index].address}',
                                                    style: TextStyle(
                                                        color: Colors.black54),
                                                  ),
                                                ]),
                                          )),
                                    ),
                                  );
                                }),
                          ),
                  ),
                ),
              ],
            ),
          ),
          Pond_String(),
          toolkit(),
          control(),
        ],
      ),
    );
  }

  Widget Pond_String() {
    return pond_string.isEmpty
        ? Text('')
        : Container(
            margin: EdgeInsets.only(top: 15),
            child: Center(
              child: Text(
                pond_string,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          );
  }

  Widget toolkit() {
    return pond_string.isEmpty
        ? Text('')
        : Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 15),
            height: 110,
            child: Column(
              children: [
                Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(left: 15, bottom: 10),
                    child: Text(
                      'Bộ thiết bị đo',
                      style: TextStyle(fontSize: 16),
                    )),
                Container(
                  height: 80,
                  color: Colors.white,
                  child: toolkit_data.isEmpty
                      ? Center(child: CircularProgressIndicator())
                      : Container(
                          padding: EdgeInsets.all(10),
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: toolkit_data.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (toolkit_data[index].idTemperature !=
                                              null &&
                                          toolkit_data[index].idPh != null &&
                                          toolkit_data[index].idLight != null) {
                                        SharedService.setToolkit(
                                            toolkit_data[index].idTemperature,
                                            toolkit_data[index].idPh,
                                            toolkit_data[index].idLight);
                                      } else if (toolkit_data[index]
                                                  .idTemperature ==
                                              null &&
                                          toolkit_data[index].idPh == null &&
                                          toolkit_data[index].idLight == null) {
                                        SharedService.setToolkit(0, 0, 0);
                                      }

                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => SensorsScreen(),
                                        ),
                                      );
                                    });
                                  },
                                  child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      color: Color(0xFFDAE8FF),
                                      child: Container(
                                        width: 100,
                                        child: Center(
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  '${toolkit_data[index].name}',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(0xFF478CFF),
                                                      fontSize: 16),
                                                ),
                                                Text(
                                                  '${toolkit_data[index].address}',
                                                  style: TextStyle(
                                                      color: Colors.black54),
                                                ),
                                              ]),
                                        ),
                                      )),
                                );
                              }),
                        ),
                ),
              ],
            ),
          );
  }

  Widget control() {
    return pond_string.isEmpty
        ? Text('')
        : Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 15),
            height: 110,
            child: Column(
              children: [
                Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(left: 15, bottom: 10),
                    child: Text(
                      'Bộ điều khiển',
                      style: TextStyle(fontSize: 16),
                    )),
                Container(
                  height: 80,
                  color: Colors.white,
                  child: control_data.isEmpty
                      ? Center(child: CircularProgressIndicator())
                      : Container(
                          padding: EdgeInsets.all(10),
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: control_data.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (control_data[index].idPumpIn !=
                                              null &&
                                          control_data[index].idPumpOut !=
                                              null &&
                                          control_data[index].idLamp != null &&
                                          control_data[index].idOxygenFan !=
                                              null) {
                                        SharedService.setControl(
                                            control_data[index].idPumpIn,
                                            control_data[index].idPumpOut,
                                            control_data[index].idLamp,
                                            control_data[index].idOxygenFan);
                                      } else if (control_data[index].idPumpIn ==
                                              null ||
                                          control_data[index].idPumpOut ==
                                              null ||
                                          control_data[index].idLamp == null ||
                                          control_data[index].idOxygenFan ==
                                              null) {
                                        SharedService.setControl(0, 0, 0, 0);
                                      }
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => DeviceScreen(),
                                        ),
                                      );
                                    });
                                  },
                                  child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      color: Color(0xFFDAE8FF),
                                      child: Container(
                                        width: 100,
                                        child: Center(
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  '${control_data[index].name}',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(0xFF478CFF),
                                                      fontSize: 16),
                                                ),
                                                Text(
                                                  '${control_data[index].address}',
                                                  style: TextStyle(
                                                      color: Colors.black54),
                                                ),
                                              ]),
                                        ),
                                      )),
                                );
                              }),
                        ),
                ),
              ],
            ),
          );
  }
}
