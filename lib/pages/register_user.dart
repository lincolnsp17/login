import 'package:flutter/material.dart';
import 'package:loginyou/pages/auth_service.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

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
                validator: (value) {
                  RegExp regex = new RegExp(
                      '/^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})/i');
                  if (value!.isEmpty) {
                    return ('Coloque seu e-mail');
                  }
                  ;
                },
                controller: emailController,
                autofocus: true,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.white, fontSize: 16),
                decoration: InputDecoration(
                    labelText: "Email:",
                    prefixIcon: Icon(Icons.email),
                    hintText: ('usuario@contato.com.br'),
                    labelStyle: TextStyle(color: Colors.white)),
              ),
              Divider(),
              TextFormField(
                validator: (value) {
                  RegExp regex = new RegExp(r'^.{6,}$');
                  if (value!.isEmpty) {
                    return ('"preencha a senha');
                  }
                },
                controller: passwordController,
                autofocus: true,
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.white, fontSize: 16),
                decoration: InputDecoration(
                    labelText: "Senha:",
                    prefixIcon: Icon(Icons.shield),
                    hintText: ('******'),
                    labelStyle: TextStyle(color: Colors.white)),
              ),
              ElevatedButton(
                onPressed: () async {
                  /*if(){}*/
                  await authService.createUserWithEmailAndPassword(
                    emailController.text,
                    passwordController.text,
                  );
                  Navigator.pop(context);
                },
                child: Text('Cadastrar'),
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
