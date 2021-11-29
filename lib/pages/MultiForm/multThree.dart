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
        body: Center(
          child: SfSlider.vertical(
            min: 40.0,
            max: 100.0,
            interval: 1,
            showTicks: true,
            showLabels: true,
            labelFormatterCallback:
                (dynamic actualValue, String formattedText) {
              return actualValue == 10000
                  ? '1, $formattedText cm'
                  : '\1,$formattedText cm';
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
