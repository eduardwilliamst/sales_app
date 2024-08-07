import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sales_app/constants.dart';
import 'package:sales_app/screens/home/home_page.dart';
import 'package:sales_app/screens/new_order/new_order_page.dart';
import 'package:sales_app/screens/order_history/order_history_page.dart';
import 'package:sales_app/screens/profile_sales/profile_page.dart';
import 'package:sales_app/screens/forget_password/new_pass_page.dart';
import 'package:sales_app/screens/login/login_page.dart';
import 'package:sales_app/screens/forget_password/forget_pass_page.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) {
        //add your certificate verification logic here
        return true;
      };
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sales App',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Lato',
        navigationBarTheme: const NavigationBarThemeData(
          backgroundColor: kSecondaryColor,
          labelTextStyle: WidgetStatePropertyAll(
            TextStyle(
                fontFamily: 'Lato', fontSize: 14, fontWeight: FontWeight.bold),
          ),
          iconTheme: WidgetStatePropertyAll(
            IconThemeData(color: Colors.black),
          ),
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
        '/orderhistory': (context) => const OrderHistoryPage(),
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
    Timer(const Duration(seconds: 2), () async {
      final preferences = await SharedPreferences.getInstance();
      final token = preferences.getString('token');

      if (token != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Onboarding1.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/LogoAmesta1.png',
                fit: BoxFit.cover,
              ),
              Image.asset(
                'assets/images/LogoAmesta2.png',
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
