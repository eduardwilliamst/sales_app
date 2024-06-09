import 'package:flutter/material.dart';
import 'dart:async';
import 'package:sales_app/constants.dart';
import 'package:sales_app/pages/home_page.dart';
import 'package:sales_app/pages/new_order_page.dart';
import 'package:sales_app/pages/order_page.dart';
import 'package:sales_app/pages/profile_page.dart';
import 'package:sales_app/pages/new_pass_page.dart';
import 'package:sales_app/pages/login_page.dart';
import 'package:sales_app/pages/forget_pass_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: const [Locale('en', 'US'), Locale('id', 'ID')],
      debugShowCheckedModeBanner: false,
      title: 'Sales App',
      theme: ThemeData(
        useMaterial3: true,
        navigationBarTheme: const NavigationBarThemeData(
          backgroundColor: kSecondaryColor,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          iconTheme: WidgetStatePropertyAll(IconThemeData(color: Colors.black)),
          indicatorColor: Color.fromRGBO(
            170,
            142,
            111,
            1.0,
          ),
        ),
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
            color: Colors.black,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Lato',
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
          labelLarge: TextStyle(
              fontFamily: 'Lato',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: kSecondaryColor),
        ),
      ),
      home: const SplashScreen(),
      routes: {
        '/login': (context) => const LoginPage(),
        '/forgetpassword': (context) => const ForgetPasswordPage(),
        '/home': (context) => const HomePage(),
        '/newpassword': (context) => const NewPasswordPage(),
        '/profile': (context) => const ProfilePage(),
        '/orderhistory': (context) => const OrderPage(),
        '/neworder': (context) => const NewOrderPage(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Onboarding1.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
