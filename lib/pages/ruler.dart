// import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ruler_picker.dart';

void main() => runApp(Teste());

class Teste extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ruler Picker Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late RulerPickerController _rulerPickerController;
  late TextEditingController _textEditingController;
  num showValue = 0;
  int fractionDigits = 0;
  @override
  void initState() {
    super.initState();
    _rulerPickerController = RulerPickerController(value: 0);
    _textEditingController = TextEditingController(text: '0');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // a ruler picker
            RulerPicker(
              controller: _rulerPickerController,
              fractionDigits: fractionDigits,
              onValueChange: (value) {
                print(value);
                setState(() {
                  Text("1,");

                  _textEditingController.text = value.toString();
                });
              },
              width: 300,
              height: 100,
            ),
            // a text field to sync the value of the ruler picker
            Container(
              margin: EdgeInsets.only(top: 20),
              width: 300,
              child: CupertinoTextField(
                controller: _textEditingController,
                onChanged: (value) {
                  showValue = num.parse(
                      num.parse(value).toStringAsFixed(fractionDigits));
                  Text("1,");
                },
                onEditingComplete: () {
                  _rulerPickerController.value = showValue;
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
