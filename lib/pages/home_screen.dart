import 'package:flutter/material.dart';
import 'package:loginyou/pages/auth_service.dart';
import 'package:provider/provider.dart';

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
        body: Center(
      child: ElevatedButton(
        onPressed: () async {
          await authService.signOut();
        },
        child: Text('Logout'),
      ),
    ));
  }
}
