// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:loginyou/pages/auth_service.dart';
import 'package:loginyou/pages/home.dart';
import 'package:loginyou/pages/resetPassword.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Divider(
                height: 50,
              ),
              Image.asset("images/muscle.png", width: 300, height: 200),
              TextFormField(
                autofocus: true,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.white, fontSize: 16),
                decoration: InputDecoration(
                    labelText: "Email:",
                    prefixIcon: Icon(Icons.email),
                    hintText: ('usuario@contato.com.br'),
                    labelStyle: TextStyle(color: Colors.white)),
                controller: emailController,
              ),
              Divider(),
              TextFormField(
                autofocus: true,
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.white, fontSize: 16),
                decoration: InputDecoration(
                    labelText: "Senha:",
                    prefixIcon: Icon(Icons.shield),
                    hintText: ('******'),
                    labelStyle: TextStyle(color: Colors.white)),
                controller: passwordController,
              ),
              Container(
                height: 40,
                alignment: Alignment.centerRight,
                child: TextButton(
                  child: Text(
                    "Recuperar Senha",
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 13, color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PasswordPage(),
                      ),
                    );
                  },
                ),
              ),
              Divider(
                height: 100,
              ),
              ElevatedButton(
                onPressed: () {
                  authService.signInWithEmailAndPassword(
                    emailController.text,
                    passwordController.text,
                  );
                },
                child: Text('Entrar'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
