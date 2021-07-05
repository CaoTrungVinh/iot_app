import 'package:flutter/material.dart';
import 'package:iot/model/pump_out_model.dart';
import 'package:iot/network/put_data.dart';
import 'package:iot/network/request_pump_out.dart';

class Device_PumpOut extends StatefulWidget {
  const Device_PumpOut({Key key}) : super(key: key);

  @override
  _Device_PumpOutState createState() => _Device_PumpOutState();
}

class _Device_PumpOutState extends State<Device_PumpOut> {
  List<PumpOut_Model> model_data = List();
  bool isLoading = false;
  bool isSwitchedBomOut = false;
  int control;
  String description = '';
  var textValueBomOut = 'Switch is OFF';

  @override
  void initState() {
    super.initState();
    get_pump_in_data();
  }

  Future<void> get_pump_in_data() async {
    if (isLoading) return;
    isLoading = true;
    await Request_PumpOut.fetchPumpOut().then(
          (value) {
        if (value == null) {
          isLoading = false;
          return;
        }
        setState(() {
          model_data = value;
          if (model_data[0].status == 1){
            isSwitchedBomOut = true;
          }else if (model_data[0].status == 0){
            isSwitchedBomOut = false;
          }
        });
        isLoading = false;
      },
      onError: (err) {
        // print(err);
        isLoading = false;
      },
    );
  }

  Future<void> switchBomOut(bool value) {
    if (isSwitchedBomOut == false) {
      setState(() {
        isSwitchedBomOut = true;
        textValueBomOut = 'Switch Button is ON';
        control = 1;
        description = 'Bơm nước từ ao nuôi ra ngoài';
        setPumpOut_OnOff(control).then((value) {
          print(value);
        });
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitchedBomOut = false;
        textValueBomOut = 'Switch Button is OFF';
        control = 0;
        description = 'Tắt máy bơm';
        setPumpOut_OnOff(control).then((value) {
          print(value);
        });
      });
      print('Switch Button is OFF');
    }
  }

  @override
  Widget build(BuildContext context) {
    return model_data.isEmpty
        ? Text('')
        : Container(
      width: 160.0,
      height: 220.0,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(const Radius.circular(15.0)),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Bơm nước ra",
            style: TextStyle(
                color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 17),
          ),
          Image(
            image: AssetImage('assets/images/bomout.png'),
            width: 70,
            height: 70,
          ),
          Transform.scale(
              scale: 1.2,
              child: Switch(
                onChanged: switchBomOut,
                value: isSwitchedBomOut,
                activeColor: Colors.blue,
                activeTrackColor: Colors.lightBlue,
                inactiveThumbColor: Colors.grey,
                inactiveTrackColor: Colors.grey[300],
              )),
          // FlatButton(
          //   child: Text("Hẹn giờ"),
          //   onPressed: () => {
          //     Navigator.of(context).push(
          //       MaterialPageRoute(
          //         builder: (context) =>
          //             Pump_In_Timer(),
          //       ),
          //     )
          //   },
          //   color: Colors.blue,
          //   textColor: Colors.white,
          // )
        ],
      ),
    );
  }
}
