import 'package:flutter/material.dart';

void main() => runApp(Rules());

class Rules extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter  Slider',
      home: MyRulePage(),
    );
  }
}

class MyRulePage extends StatefulWidget {
  @override
  _MyRulePageState createState() => _MyRulePageState();
}

class _MyRulePageState extends State<MyRulePage> {
  int height = 180;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Proto Coders Point Demo on Flutter Slider',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 50.0,
            ),
            Text(
              "SET HEIGHT",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30.0),
            ),
            SizedBox(
              height: 50.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: <Widget>[
                Text(
                  height.toString(),
                  style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w900),
                ),
                Text("cm")
              ],
            ),
            Slider(
              value: height.toDouble(),
              min: 80,
              max: 220,
              activeColor: Colors.pink,
              onChanged: (double value) {
                setState(() {
                  height = value.round();
                });
              },
            ),
            Text("Just slide the Flutter Slider to change value")
          ],
        ),
      ),
    );
  }
}
