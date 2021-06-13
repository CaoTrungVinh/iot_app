import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class Temp_Chart_Screen extends StatefulWidget {
  const Temp_Chart_Screen({Key key}) : super(key: key);

  @override
  _Temp_Chart_ScreenState createState() => _Temp_Chart_ScreenState();
}

class _Temp_Chart_ScreenState extends State<Temp_Chart_Screen> {
  List<SalesData> _chartData;
  TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
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
            'Temperature chart',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ), //style of title
          ), //title
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: SfCartesianChart(
          // legend: Legend(isVisible: true),
          tooltipBehavior: _tooltipBehavior,
          series: <ChartSeries>[
            LineSeries<SalesData, double>(
                // name: 'Sales',
                dataSource: _chartData,
                xValueMapper: (SalesData sales, _) => sales.year,
                yValueMapper: (SalesData sales, _) => sales.temp,
                dataLabelSettings: DataLabelSettings(isVisible: true),
                enableTooltip: true)
          ],
          primaryXAxis: NumericAxis(
            edgeLabelPlacement: EdgeLabelPlacement.shift,
          ),
          primaryYAxis: NumericAxis(
              labelFormat: '{value}*C',
              numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0)),
        ));
  }

  List<SalesData> getChartData() {
    final List<SalesData> chartData = [
      SalesData(2017, 25),
      SalesData(2018, 12),
      SalesData(2019, 24),
      SalesData(2020, 18),
      SalesData(2021, 30),
      SalesData(2022, 12.5),
      SalesData(2023, 24),
      SalesData(2024, 38),
      SalesData(2025, 30),
    ];
    return chartData;
  }
}

class SalesData {
  SalesData(this.year, this.temp);

  final double year;
  final double temp;
}
