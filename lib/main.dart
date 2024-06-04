import 'package:flutter/material.dart';
import 'new_pass_page.dart';
import 'splash_screen.dart';
import 'login_page.dart';
import 'forget_pass_page.dart';
import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          headlineLarge: TextStyle(
              fontFamily: 'DMSerifText',
              fontSize: 24,
              fontWeight: FontWeight.normal,
              color: Colors.black),
          bodyLarge: TextStyle(
            fontFamily: 'Lato',
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Lato',
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
          labelLarge: TextStyle(
              fontFamily: 'Lato',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
      home: SplashScreen(),
      routes: {
        '/login': (context) => LoginPage(),
        '/forgetpassword': (context) => ForgetPasswordPage(),
        '/home': (context) => HomePage(),
        '/newpassword': (context) => NewPasswordPage(),
      },
    );
  }
}
