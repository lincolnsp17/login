// ignore_for_file: prefer_const_constructors, file_names

import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginyou/pages/auth_service.dart';
import 'package:loginyou/pages/loginPage.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

final String assetName = 'assets/menu.svg';
final Widget svgIcon = SvgPicture.asset(assetName,
    color: Colors.red, semanticsLabel: 'A red up arrow');

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Stack(
            children: <Widget>[
              Container(
                alignment: AlignmentDirectional.topEnd,
                child: Icon(
                  Icons.account_box_rounded,
                  color: Colors.black,
                  size: 35,
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: <Widget>[
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 35,
                    left: 20,
                    bottom: 10,
                  ),
                  child: Text(
                    'Seja bem Vindo',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
              ],
            ),
            Image.asset("images/slide.png"),
          ],
        ),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text('Drawer Header'),
                ),
                Card(
                  child: ListTile(
                    onTap: () async {
                      await authService.signOut();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => LoginPage()));
                    },
                    leading: Icon(Icons.exit_to_app),
                    title: Text('Sair'),
                  ),
                ),
              ]),
        )
        /*body: Center(

          child: ElevatedButton(
            onPressed: () async {
              await authService.signOut();
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => LoginPage()));
            },
            child: Text('Logout'),
          ),
        )*/
        );
  }

  final FirebaseAuth auth = FirebaseAuth.instance;

  void inputData() {
    final User? user = auth.currentUser;
    final uid = user!.uid;
    print(uid);
  }
}
