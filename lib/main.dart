import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loginyou/pages/MultiForm/multOne.dart';
import 'package:loginyou/pages/MultiForm/multTwo.dart';
import 'package:loginyou/pages/auth_service.dart';
import 'package:loginyou/pages/HomePage.dart';
import 'package:loginyou/pages/loginPage.dart';
import 'package:loginyou/pages/register_user.dart';
import 'package:loginyou/pages/ruler.dart';
import 'package:loginyou/pages/wrapper.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(),
        ),
      ],
      child: MaterialApp(
        title: 'Login teste',
        initialRoute: '/',
        routes: {
          '/': (context) => multTwo(),
          '/login': (context) => Wrapper(),
          '/register': (context) => RegisterPage(),
        },
      ),
    );
  }
}
