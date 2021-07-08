import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:iot/model/pump_in_model.dart';
import 'package:iot/network/present_time.dart';
import 'package:iot/network/put_data.dart';
import 'package:iot/network/request_pump_in.dart';

class Pump_In_Timer extends StatefulWidget {
  @override
  _Pump_In_TimerState createState() => _Pump_In_TimerState();
}

class _Pump_In_TimerState extends State<Pump_In_Timer> {
  String _setTime_On, _setDate_On;
  String _hour_on, _minute_on, _time_on;
  String dateTime_On;
  DateTime selectedDate_On = DateTime.now();
  TimeOfDay selectedTime_On = TimeOfDay(hour: 00, minute: 00);
  TextEditingController _dateController_On = TextEditingController();
  TextEditingController _timeController_On = TextEditingController();

  String _setTime_Off, _setDate_Off;
  String _hour_off, _minute_off, _time_off;
  String dateTime_Off;
  DateTime selectedDate_Off = DateTime.now();
  TimeOfDay selectedTime_Off = TimeOfDay(hour: 00, minute: 00);
  TextEditingController _dateController_Off = TextEditingController();
  TextEditingController _timeController_Off = TextEditingController();

  bool isLoading = false;
  int device;

  String date_on, date_off;
  List<PumpIn_Model> model_data = List();
  String timer_on_day;
  String timer_off_day;

  Future<Null> _selectTime_On(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: selectedTime_On,
    );
    if (picked != null)
      setState(() {
        selectedTime_On = picked;
        _hour_on = selectedTime_On.hour.toString();
        _minute_on = selectedTime_On.minute.toString();
        _time_on = _hour_on + ' : ' + _minute_on;
        _timeController_On.text = _time_on;
        _timeController_On.text = formatDate(
            DateTime(2019, 08, 1, selectedTime_On.hour, selectedTime_On.minute),
            [HH, ':', nn]).toString();
        print('Giờ bật: ' + _timeController_On.text);
      });
  }

  Future<Null> _selectTime_Off(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: selectedTime_Off,
    );
    if (picked != null)
      setState(() {
        selectedTime_Off = picked;
        _hour_off = selectedTime_Off.hour.toString();
        _minute_off = selectedTime_Off.minute.toString();
        _time_off = _hour_off + ' : ' + _minute_off;
        _timeController_Off.text = _time_off;
        _timeController_Off.text = formatDate(
            DateTime(
                2019, 08, 1, selectedTime_Off.hour, selectedTime_Off.minute),
            [HH, ':', nn]).toString();
        print('Giờ bật: ' + _timeController_Off.text);
      });
  }

  Future<void> get_Device() async {
    if (isLoading) return;
    isLoading = true;
    await Request_PumpIn.fetchPumpIn().then(
      (value) {
        if (value == null) {
          isLoading = false;
          return;
        }
        setState(() {
          model_data = value;
          device = model_data[0].status;
          timer_on_day = model_data[0].timerOn.toString();
          timer_off_day = model_data[0].timerOff.toString();
          print(device);
        });
        isLoading = false;
      },
      onError: (err) {
        isLoading = false;
      },
    );
  }

  @override
  void initState() {
    super.initState();
    get_Device();
  }

  @override
  Widget build(BuildContext context) {
    dateTime_On = DateFormat('yyyy/MM/dd').format(DateTime.now());
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
          'Hẹn giờ',
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20.0),
              alignment: Alignment.center,
              child: Image(
                image: AssetImage('assets/images/bomin.png'),
                height: 140,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      'Giờ bật máy bơm',
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 15.5,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        _selectTime_On(context);
                      },
                      child: Container(
                        width: 150,
                        // alignment: Alignment.topLeft,
                        decoration: BoxDecoration(color: Colors.grey[200]),
                        child: TextFormField(
                          style: TextStyle(fontSize: 14),
                          textAlign: TextAlign.center,
                          onSaved: (String val) {
                            _setTime_On = val;
                          },
                          enabled: false,
                          keyboardType: TextInputType.text,
                          controller: _timeController_On,
                          decoration: InputDecoration(
                              hintText: 'Chọn giờ',
                              disabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none),
                              // labelText: 'Time',
                              contentPadding: EdgeInsets.all(5)),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  children: [
                    Text('Giờ tắt máy bơm',
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 15.5,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        _selectTime_Off(context);
                      },
                      child: Container(
                        width: 150,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(color: Colors.grey[200]),
                        child: TextFormField(
                          style: TextStyle(fontSize: 14),
                          textAlign: TextAlign.center,
                          onSaved: (String val) {
                            _setTime_Off = val;
                          },
                          enabled: false,
                          keyboardType: TextInputType.text,
                          controller: _timeController_Off,
                          decoration: InputDecoration(
                              hintText: 'Chọn giờ',
                              disabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none),
                              // labelText: 'Time',
                              contentPadding: EdgeInsets.all(5)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              // height: 48,
              width: 1000,
              child: RaisedButton(
                onPressed: () {
                  date_on = _timeController_On.text;
                  date_off = _timeController_Off.text;

                  _timeController_On.text.isEmpty ||
                          _timeController_Off.text.isEmpty
                      ? _showErro()
                      : device == 0 || device == 2
                          ? _showDialogTimerOnOff(date_on, date_off)
                          : _showErro();
                },
                elevation: 5,
                padding: EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: Colors.blueAccent,
                child: Text('HẸN GIỜ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _showErro() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Hẹn giờ'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                device == 0 || device == 2
                    ? Text('Vui lòng nhập lại')
                    : Text('Vui lòng tắt máy bơm và nhập lại'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Đồng ý'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  _showDialogTimerOnOff(String timer_on, String timer_off) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Hẹn giờ'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Bật bơm: ' + date_on.toString()),
                Text('Tắt bơm: ' + date_off.toString()),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Huỷ bỏ'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Đồng ý'),
              onPressed: () async {
                print('Post data');
                await set_timer_pump_in(timer_on, timer_off).then((value) {
                  print(value);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
