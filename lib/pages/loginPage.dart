// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:loginyou/pages/auth_service.dart';
import 'package:loginyou/pages/HomePage.dart';
import 'package:loginyou/pages/resetPassword.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

// Pagina de login
class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    // controladores dos campos de login
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      backgroundColor: Color(0xFF161920),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: <Widget>[
              Divider(
                height: 50,
                color: Colors.transparent,
              ),
              Image.asset("images/logohiper.png", width: 300, height: 200),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 30),
                    ),
                  ),
                ],
              ),
              TextField(
                controller: emailController,
                //autofocus: true,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.white, fontSize: 16),
                decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 0.5),
                    ),
                    labelText: "Email:",
                    prefixIcon: Icon(Icons.email, color: Colors.white),
                    hintText: ('usuario@contato.com.br'),
                    labelStyle: TextStyle(color: Colors.white)),
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
                    enabledBorder: const OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 0.5),
                    ),
                    labelText: "Senha:",
                    prefixIcon: Icon(Icons.shield, color: Colors.white),
                    hintText: ('******'),
                    labelStyle: TextStyle(color: Colors.white)),
              ),
              Container(
                height: 40,
                alignment: Alignment.centerRight,
                child: TextButton(
                  child: Text(
                    "Esqueceu sua senha?",
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 13, color: Color(0xFF3D59C9)),
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
                height: 120,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(200, 60),
                  primary: (Color(0xFF3D59C9)),
                  shadowColor: Colors.teal,
                ),
                child: Text('Entrar'),
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
              ),
              Divider(
                height: 40,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: Text.rich(
                    TextSpan(
                      text: 'Não possui cadastro? ',
                      style: TextStyle(color: Colors.white),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Cadastre-se',
                          style: TextStyle(color: Color(0xFF3D59C9)),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
