import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class Ph_Chart_Screen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, // navigation bar color
      statusBarColor: Colors.transparent, // status bar color
      statusBarIconBrightness: Brightness.dark, // status bar icons' color
      systemNavigationBarIconBrightness:
          Brightness.dark, //navigation bar icons' color
    ));
    return MaterialApp(
      home: Ph_Chart(),
    );
  }
}

class Ph_Chart extends StatefulWidget {
  Ph_Chart({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Ph_ChartState createState() => _Ph_ChartState();
}

class _Ph_ChartState extends State<Ph_Chart> {
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
        body: SafeArea(
          child: SfCartesianChart(
            title: ChartTitle(text: 'Temperature chart'),
            // legend: Legend(isVisible: true),
            tooltipBehavior: _tooltipBehavior,
            series: <ChartSeries>[
              LineSeries<SalesData, double>(
                  name: 'Sales',
                  dataSource: _chartData,
                  xValueMapper: (SalesData sales, _) => sales.year,
                  yValueMapper: (SalesData sales, _) => sales.sales,
                  dataLabelSettings: DataLabelSettings(isVisible: true),
                  enableTooltip: true)
            ],
            primaryXAxis: NumericAxis(
              edgeLabelPlacement: EdgeLabelPlacement.shift,
            ),
            primaryYAxis: NumericAxis(
                labelFormat: '{value}*C',
                numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0)),
          ),
        )
    );
  }

  List<SalesData> getChartData() {
    final List<SalesData> chartData = [
      SalesData(2017, 25),
      SalesData(2018, 12),
      SalesData(2019, 24),
      SalesData(2020, 18),
      SalesData(2021, 30),
      SalesData(2022, 12),
      SalesData(2023, 24),
      SalesData(2024, 38),
      SalesData(2025, 30),
      SalesData(2026, 25),
      SalesData(2027, 34),
      SalesData(2028, 24),
      SalesData(2029, 18),
      SalesData(2030, 30),
      SalesData(2031, 12),
      SalesData(2032, 24),
      SalesData(2033, 18),
      SalesData(2034, 30),
      SalesData(2035, 25),
      SalesData(2036, 12),
      SalesData(2037, 24),
      SalesData(2038, 18),
      SalesData(2039, 30),
      SalesData(2040, 12),
      SalesData(2041, 24),
      SalesData(2042, 18),
      SalesData(2043, 30),
      SalesData(2044, 25),
      SalesData(2045, 12),
      SalesData(2046, 24),
      SalesData(2047, 18),
      SalesData(2048, 30),
      SalesData(2049, 12),
      SalesData(2050, 24),
      SalesData(2051, 18),
      SalesData(2052, 50),
    ];
    return chartData;
  }
}

class SalesData {
  SalesData(this.year, this.sales);

  final double year;
  final double sales;
}
