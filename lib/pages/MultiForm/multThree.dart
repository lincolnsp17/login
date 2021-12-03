import 'package:flutter/material.dart';
import 'package:height_slider/height_slider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: multThree(),
    );
  }
}

class multThree extends StatefulWidget {
  @override
  _multThreeState createState() => _multThreeState();
}

class _multThreeState extends State<multThree> {
  int height = 170;
  double _value = 4.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('texto'),
        ),
        body: Container(
          width: 500,
          child: SfSlider(
            min: 40.0,
            max: 90.0,
            interval: 10,
            showTicks: true,
            showLabels: true,
            minorTicksPerInterval: 10,
            labelFormatterCallback:
                (dynamic actualValue, String formattedText) {
              return actualValue == 10000
                  ? '1, $formattedText m'
                  : '\1,$formattedText m';
            },
            value: _value,
            onChanged: (dynamic newValue) {
              setState(() {
                _value = newValue;
              });
            },
          ),
        ));
  }
}
