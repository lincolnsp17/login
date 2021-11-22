// ignore: file_names
// ignore_for_file: camel_case_types, prefer_const_constructors, file_names

import 'package:flutter/material.dart';

// ignore: camel_case_types
class multOne extends StatefulWidget {
  const multOne({Key? key}) : super(key: key);

  @override
  _multOneState createState() => _multOneState();
}

class _multOneState extends State<multOne> {
  @override
  Widget build(BuildContext context) {
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
                Colors.black.withOpacity(0.4), BlendMode.dstATop),
          ),
        ),
        child: Container(
          color: Colors.transparent,
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.all(26.0),
                child: Card(
                  color: Colors.transparent,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Image.asset(
                      'images/woman.png',
                      width: 150,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Image.asset(
                      'images/men.png',
                      width: 160,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
