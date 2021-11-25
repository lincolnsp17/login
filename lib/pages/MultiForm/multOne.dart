// ignore_for_file: camel_case_types, prefer_const_constructors, file_names

import 'package:flutter/material.dart';

class multOne extends StatefulWidget {
  const multOne({Key? key}) : super(key: key);

  @override
  _multOneState createState() => _multOneState();
}

class _multOneState extends State<multOne> {
  bool _CardIndex = false;

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
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.4), BlendMode.dstATop),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(),
            Container(
              color: Colors.transparent,
              alignment: Alignment.center,
              child: Text(
                'sla',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
            Positioned(
              child: Container(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 23.0,
                      ),
                      child: Row(
                        children: <Widget>[
                          GestureDetector(
                            child: Card(
                              color: ((_CardIndex == true)
                                  ? Colors.blue
                                  : Colors.white),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 16.0,
                                    bottom: 16.0,
                                    left: 16.0,
                                    right: 16.0),
                                child: Image.asset(
                                  'images/woman.png',
                                  width:
                                      ((_CardIndex == true) ? 140 : 110), //140
                                ),
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                if (_CardIndex = !_CardIndex) {
                                  print("$_CardIndex");
                                  _CardIndex == true;
                                }
                              });
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 0.0, bottom: 0.0, left: 10.0, right: 0.0),
                            child: GestureDetector(
                              child: Card(
                                color: ((_CardIndex == false)
                                    ? Colors.blue
                                    : Colors.white),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 16.0,
                                      bottom: 16.0,
                                      left: 10.0,
                                      right: 16.0),
                                  child: Image.asset(
                                    'images/testemen.png',
                                    width: ((_CardIndex == false)
                                        ? 160
                                        : 130), //160
                                  ),
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  if (_CardIndex = !_CardIndex) {
                                    print("$_CardIndex");
                                    _CardIndex == false;
                                  }
                                  ;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        color: Colors.black12,
        child: InkWell(
          onTap: () => print('tap on close'),
          child: Container(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.only(top: 8.0, right: 20),
              child: Column(
                children: const <Widget>[
                  Text(
                    'Continuar',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
