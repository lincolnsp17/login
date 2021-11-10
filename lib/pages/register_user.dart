import 'package:flutter/material.dart';
import 'package:loginyou/pages/auth_service.dart';
import 'package:loginyou/pages/loginPage.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final passwordconfirmController = TextEditingController();
    final nameController = TextEditingController();

    final authService = Provider.of<AuthService>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            );
          },
        ),
      ),
      backgroundColor: Colors.deepPurple,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Divider(
                height: 20,
              ),
              Text(
                'Crie sua conta',
                style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.white),
              ),
              Divider(),
              Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 20)),
              buildTextFormField("Nome:", nameController, "Fortin do bairro",
                  IconData(983150, fontFamily: 'MaterialIcons')),
              Divider(),
              buildTextFormField(
                  "Email:",
                  emailController,
                  "usuario@imodulo.com",
                  IconData(57898, fontFamily: 'MaterialIcons')),
              Divider(),
              buildTextFormField("Senha:", passwordController, "********",
                  IconData(58774, fontFamily: 'MaterialIcons')),
              Divider(),
              buildTextFormField("Confirme a senha:", passwordconfirmController,
                  "********", IconData(58774, fontFamily: 'MaterialIcons')),
              Divider(),
              Divider(),
              ElevatedButton(
                onPressed: () async {
                  /*if(){}*/
                  await authService.createUserWithEmailAndPassword(
                    emailController.text,
                    passwordController.text,
                  );
                  Navigator.pop(context);
                },
                child: Text('Cadastrar-se'),
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

Widget buildTextFormField(
  String label,
  TextEditingController c,
  String hintText,
  IconData icone,
) {
  return TextFormField(
    controller: c,
    keyboardType: TextInputType.emailAddress,
    style: TextStyle(color: Colors.white, fontSize: 16),
    decoration: InputDecoration(
      labelText: label,
      prefixIcon: Icon(icone),
      hintText: hintText,
      labelStyle: TextStyle(color: Colors.white),
    ),
  );
}

/* TextFormField(
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
                    return ('preencha a senha');
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
              Divider(),
              TextFormField(
                validator: (value) {
                  RegExp regex = new RegExp(r'^.{6,}$');
                  if (value!.isEmpty) {
                    return ('preencha a senha');
                  }
                },
                controller: passwordconfirmController,
                autofocus: true,
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.white, fontSize: 16),
                decoration: InputDecoration(
                    labelText: "Corfirme a senha:",
                    prefixIcon: Icon(Icons.shield),
                    hintText: ('******'),
                    labelStyle: TextStyle(color: Colors.white)),
              ),
              */