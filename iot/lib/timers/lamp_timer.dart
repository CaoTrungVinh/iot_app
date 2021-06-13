import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:iot/network/present_time.dart';
import 'package:iot/network/post_data.dart';

class Lamp_Timer extends StatefulWidget {
  @override
  _Lamp_TimerState createState() => _Lamp_TimerState();
}

class _Lamp_TimerState extends State<Lamp_Timer> {
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

  String date_on, date_off;

  Future<Null> _selectDate_On(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate_On,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null)
      setState(() {
        selectedDate_On = picked;
        _dateController_On.text =
            DateFormat('yyyy/MM/dd').format(selectedDate_On);
        print('Ngày bật: ' + _dateController_On.text);
      });
  }

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

  Future<Null> _selectDate_Off(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate_Off,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null)
      setState(() {
        selectedDate_Off = picked;
        _dateController_Off.text =
            DateFormat('yyyy/MM/dd').format(selectedDate_Off);
        print('Ngày tắt: ' + _dateController_Off.text);
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

  @override
  void initState() {
    _dateController_On.text = 'Chọn ngày';
    _timeController_On.text = 'Chọn giờ';
    _dateController_Off.text = 'Chọn ngày';
    _timeController_Off.text = 'Chọn giờ';
    super.initState();
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
          'Hẹn giờ bật tắt đèn',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ), //style of title
        ), //title
        backgroundColor: Colors.white,
        centerTitle: true,
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
                image: AssetImage('assets/images/light.png'),
                height: 140,
              ),
            ),
            Text(
              'Ngày giờ bật đèn',
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 15.5,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    _selectDate_On(context);
                  },
                  child: Container(
                    width: 150,
                    // alignment: Alignment.center,
                    decoration: BoxDecoration(color: Colors.grey[200]),
                    child: TextFormField(
                      style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.center,
                      enabled: false,
                      keyboardType: TextInputType.text,
                      controller: _dateController_On,
                      onSaved: (String val) {
                        _setDate_On = val;
                      },
                      decoration: InputDecoration(
                          disabledBorder:
                          UnderlineInputBorder(borderSide: BorderSide.none),
                          // labelText: 'Time',
                          contentPadding: EdgeInsets.only(top: 0.0)),
                    ),
                  ),
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
                          disabledBorder:
                          UnderlineInputBorder(borderSide: BorderSide.none),
                          // labelText: 'Time',
                          contentPadding: EdgeInsets.all(5)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text('Ngày giờ tắt đèn',
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 15.5,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 10,
            ),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    _selectDate_Off(context);
                  },
                  child: Container(
                    width: 150,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: Colors.grey[200]),
                    child: TextFormField(
                      style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.center,
                      enabled: false,
                      keyboardType: TextInputType.text,
                      controller: _dateController_Off,
                      onSaved: (String val) {
                        _setDate_Off = val;
                      },
                      decoration: InputDecoration(
                          disabledBorder:
                          UnderlineInputBorder(borderSide: BorderSide.none),
                          // labelText: 'Time',
                          contentPadding: EdgeInsets.only(top: 0.0)),
                    ),
                  ),
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
                          disabledBorder:
                          UnderlineInputBorder(borderSide: BorderSide.none),
                          // labelText: 'Time',
                          contentPadding: EdgeInsets.all(5)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              // height: 48,
              width: 1000,
              child: RaisedButton(
                onPressed: () {
                  date_on = _dateController_On.text + ' ' + _timeController_On.text;
                  date_off = _dateController_Off.text + ' ' + _timeController_Off.text;

                  _dateController_On.text.contains('Chọn ngày') ||
                      _dateController_On.text.contains('Chọn giờ') ||
                      _dateController_Off.text.contains('Chọn ngày') ||
                      _timeController_Off.text.contains('Chọn giờ')
                      ? _showErro()
                      : _showDialogTimerOnOff(context,2,'Hẹn giờ bật tắt đèn tự động',todayDate(),date_on,date_off);
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
          title: Text('Hẹn giờ bật tắt đèn'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Vui lòng nhập lại'),
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

  _showDialogTimerOnOff(BuildContext context, int control, String description,
      String created_at, String timer_on, String timer_off) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Hẹn giờ bật tắt đèn'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Bật đèn: ' + date_on.toString()),
                Text('Tắt đèn: ' + date_off.toString()),
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
                await Timer_Device_Lamp_On_Off(control, description, created_at, timer_on, timer_off).then((value) {
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
