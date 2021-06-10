import 'package:intl/intl.dart';

String todayDate() {
  // var now = new DateTime.now();
  // var formatter = new DateFormat('yyyy/MM/dd');
  // String formattedTime = DateFormat('kk:mm:a').format(now);
  // String formattedDate = formatter.format(now);
  // print(formattedDate + ' ' + formattedTime);

  // DateTime now = DateTime.now();
  // String formattedDate = DateFormat('yyyy-MM-dd HH:mm').format(now);
  // print(formattedDate + 'abc');

  var stringList =  DateTime.now().toIso8601String().split(new RegExp(r"[T\.]"));
  var formatedDate = "${stringList[0]} ${stringList[1]}";

  return formatedDate.toString();
}