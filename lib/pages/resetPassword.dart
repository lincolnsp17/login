// ignore_for_file: file_names

import 'package:flutter/material.dart';

class PasswordPage extends StatefulWidget {
  const PasswordPage({Key? key}) : super(key: key);

  @override
  _PasswordPageState createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(
          top: 0,
          left: 40,
          right: 40,
        ),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Divider(),
            SizedBox(
              width: 150,
              height: 150,
              child: Image.asset("images/change.png"),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Esqueceu sua senha?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Por favor, informe o E-mail vinculado a sua conta:",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              autofocus: true,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(color: Colors.white, fontSize: 20),
              decoration: const InputDecoration(
                  hintText: "usuario@conta.com.br",
                  prefixIcon: Icon(Icons.email),
                  labelStyle: TextStyle(color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}
