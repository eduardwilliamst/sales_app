import 'package:flutter/material.dart';
import 'package:sales_app/profile_page.dart';
import 'new_pass_page.dart';
import 'splash_screen.dart';
import 'login_page.dart';
import 'forget_pass_page.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('id', 'ID')
      ],
      debugShowCheckedModeBanner: false,
      title: 'Sales App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
              fontFamily: 'DMSerifText',
              fontSize: 24,
              fontWeight: FontWeight.normal,
              color: Colors.black),
          headlineMedium: TextStyle(
              fontFamily: 'DMSerifText',
              fontSize: 16,
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
      home: const SplashScreen(),
      routes: {
        '/login': (context) => LoginPage(),
        '/forgetpassword': (context) => ForgetPasswordPage(),
        '/home': (context) => HomePage(),
        '/newpassword': (context) => NewPasswordPage(),
        '/profile': (context) => ProfilePage(),
      },
    );
  }
}
