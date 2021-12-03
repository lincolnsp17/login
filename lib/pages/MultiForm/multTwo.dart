// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, annotate_overrides, override_on_non_overriding_member, camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:height_slider/height_slider.dart';

class multTwo extends StatefulWidget {
  const multTwo({Key? key}) : super(key: key);

  @override
  _multTwoState createState() => _multTwoState();
}

class _multTwoState extends State<multTwo> {
  @override
  double _value = 4.0;
  Widget build(BuildContext context) {
    int height = 200;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: TextButton(
          child: Text(
            'Voltar',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          onPressed: () {},
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/fundo.jpeg'),
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(
                Colors.white.withOpacity(0.4), BlendMode.dstATop),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            SfSlider(
              min: 0.0,
              max: 10.0,
              interval: 2,
              numberFormat: NumberFormat('\$'),
              activeLabelStyle: TextStyle(
                  color: Colors.red, fontSize: 12, fontStyle: FontStyle.italic),
              showLabels: true,
              showTicks: true,
              value: _value,
              onChanged: (dynamic newValue) {
                setState(() {
                  _value = newValue;
                });
              },
            ),
            Container(),
          ],
        ),
      ),
    );
  }

  NumberFormat(String s) {}
}
