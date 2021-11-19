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

    bool verificacao = false;
    void clean() {
      if (nameController.value.text.isEmpty ||
          emailController.value.text.isEmpty ||
          passwordController.value.text.isEmpty ||
          passwordconfirmController.value.text.isEmpty) {}
    }

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
      backgroundColor: Color(0xFF161920),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Divider(
                height: 100,
              ),
              Text(
                'Registrar-se',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 40,
                    color: Colors.white),
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 20)),
              //WIDGET ABSTRATO PARA CONTRUIR OS BOTÕES
              buildTextFormField(
                TextInputType.emailAddress,
                "Nome:",
                nameController,
                "Fortin do bairro",
                IconData(983150, fontFamily: 'MaterialIcons'),
                false,
              ),
              buildTextFormField(
                TextInputType.emailAddress,
                "Email:",
                emailController,
                "usuario@imodulo.com",
                IconData(57898, fontFamily: 'MaterialIcons'),
                false,
              ),
              buildTextFormField(
                TextInputType.visiblePassword,
                "Senha:",
                passwordController,
                "********",
                IconData(58774, fontFamily: 'MaterialIcons'),
                true,
              ),
              buildTextFormField(
                TextInputType.emailAddress,
                "Confirme a senha:",
                passwordconfirmController,
                "********",
                IconData(58774, fontFamily: 'MaterialIcons'),
                true,
              ),
              Divider(
                height: 100,
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(200, 60),
                  primary: (Color(0xFF3D59C9)),
                  shadowColor: Colors.teal,
                ),
                onPressed: () async {
                  if (nameController.value.text.isEmpty ||
                      emailController.value.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Email vazio ou Nome invalido')));
                  } else if (passwordController.value.text !=
                      passwordconfirmController.value.text) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Confirmação de senha errada')));
                  } else {
                    await authService.createUserWithEmailAndPassword(
                        emailController.text, passwordController.text, null);
                    Navigator.pop(context);
                  }
                },
                child: Text('Cadastrar-se'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildTextFormField(
  TextInputType type,
  String label,
  TextEditingController c,
  String hintText,
  IconData icone,
  obscure,
) {
  return Column(
    children: [
      Divider(
        height: 25,
      ),
      TextFormField(
        controller: c,
        keyboardType: type,
        obscureText: obscure,
        style: TextStyle(color: Colors.white, fontSize: 16),
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white, width: 0.5),
          ),
          labelText: label,
          prefixIcon: Icon(icone, color: Colors.white),
          hintText: hintText,
          labelStyle: TextStyle(color: Colors.white),
        ),
      ),
    ],
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