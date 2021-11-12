// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:loginyou/pages/auth_service.dart';
import 'package:loginyou/pages/home_screen.dart';
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
      backgroundColor: Colors.purple,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Divider(
                height: 50,
                color: Colors.transparent,
              ),
              Image.asset("images/logohiper.png", width: 300, height: 200),
              TextField(
                controller: emailController,
                //autofocus: true,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.white, fontSize: 16),
                decoration: InputDecoration(
                    labelText: "Email:",
                    prefixIcon: Icon(Icons.email),
                    hintText: ('usuario@contato.com.br'),
                    labelStyle: TextStyle(color: Colors.black)),
              ),
              Divider(
                color: Colors.transparent,
              ),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.white, fontSize: 16),
                decoration: InputDecoration(
                    labelText: "Senha:",
                    prefixIcon: Icon(Icons.shield),
                    hintText: ('******'),
                    labelStyle: TextStyle(color: Colors.black)),
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
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => HomePage()));
                },
                child: Text('Entrar'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: Text('Registrar'),
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
