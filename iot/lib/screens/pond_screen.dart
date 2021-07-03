import 'package:flutter/material.dart';
import 'package:iot/model/pond_model.dart';
import 'package:iot/network/request_pond.dart';

class PondScreen extends StatefulWidget {
  const PondScreen({Key key}) : super(key: key);

  @override
  _PondScreenState createState() => _PondScreenState();
}

class _PondScreenState extends State<PondScreen> {
  List<Pond_Model> pond_data = List();
  bool isLoading = false;

  @override
  void initState() {
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
    return Center(
      child: ElevatedButton(
        child: Text('click'),
        onPressed: () async {

          },
      ),
    );
  }
}