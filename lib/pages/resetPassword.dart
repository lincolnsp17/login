// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:loginyou/pages/loginPage.dart';

class PasswordPage extends StatefulWidget {
  PasswordPage({Key? key}) : super(key: key);

  @override
  _PasswordPageState createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF161920),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 0,
          left: 40,
          right: 40,
        ),
        child: ListView(
          children: <Widget>[
            Divider(),
            SizedBox(
              width: 150,
              height: 150,
              child: Image.asset("images/lock.png"),
              //<a target="_blank" href="https://icons8.com/icon/15451/lock">Lock</a> icon by <a target="_blank" href="https://icons8.com">Icons8</a>
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Esqueceu sua senha?",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Por favor, informe o E-mail vinculado a sua conta:",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, color: Colors.white),
            ),
            SizedBox(
              height: 50,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.white, fontSize: 20),
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 0.5),
                  ),
                  hintText: ("usuario@conta.com.br"),
                  hintStyle: TextStyle(color: Colors.white30),
                  prefixIcon: Icon(Icons.email, color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white)),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 60),
                primary: (Color(0xFF3D59C9)),
                shadowColor: Colors.teal,
              ),
              child: Text('Entrar'),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => LoginPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
