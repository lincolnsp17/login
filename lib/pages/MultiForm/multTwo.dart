import 'package:flutter/material.dart';

class multTwo extends StatefulWidget {
  const multTwo({Key? key}) : super(key: key);

  @override
  _multTwoState createState() => _multTwoState();
}

class _multTwoState extends State<multTwo> {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            Container(
              child: Text('sla',
                  style: TextStyle(color: Colors.white, fontSize: 25)),
            ),
            Container(),
            Container(),
          ],
        ),
      ),
    );
  }
}
