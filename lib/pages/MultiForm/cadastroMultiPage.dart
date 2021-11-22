// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:loginyou/pages/MultiForm/multOne.dart';

class cadastroMult extends StatefulWidget {
  const cadastroMult({Key? key}) : super(key: key);

  @override
  _cadastroMultState createState() => _cadastroMultState();
}

class _cadastroMultState extends State<cadastroMult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Navigator(
        initialRoute: '/one',
        onGenerateRoute: (settings) {
          var route = settings.name;
          Widget page;

          switch (route) {
            case '/one':
              page = page = const multOne();
              break;
            default:
              return null;
          }
          return MaterialPageRoute(
              builder: (context) => page, settings: settings);
        },
      ),
    );
  }
}
