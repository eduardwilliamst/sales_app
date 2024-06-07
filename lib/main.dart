import 'package:flutter/material.dart';
import 'package:sales_app/constants.dart';
import 'package:sales_app/home_page.dart';
import 'package:sales_app/order_page.dart';
import 'package:sales_app/profile_page.dart';
import 'package:sales_app/new_pass_page.dart';
import 'package:sales_app/login_page.dart';
import 'package:sales_app/forget_pass_page.dart';

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
              color: kSecondaryColor),
        ),
      ),
      home: const HomePage(),
      routes: {
        '/login': (context) => const LoginPage(),
        '/forgetpassword': (context) => const ForgetPasswordPage(),
        '/home': (context) => const HomePage(),
        '/newpassword': (context) => const NewPasswordPage(),
        '/profile': (context) => const ProfilePage(),
        '/order': (context) => const OrderPage(),
      },
    );
  }
}
