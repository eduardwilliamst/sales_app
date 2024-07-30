// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sales_app/constants.dart';
import 'package:sales_app/screens/forget_password/forget_pass_page.dart';
import 'package:sales_app/screens/home/home_page.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  Future<void> _login() async {
    // final result = await API().postRequest(route: '/users/login', data: userData);
    final response = await http.post(
      Uri.parse('https://api.abdaelnusa.com/api/v1/users/login'),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'User-Agent': 'insomnia/9.2.0',
      },
      body: {
        'email': _emailController.text,
        'password': _passwordController.text,
      },
    );
    final session = jsonDecode(response.body);
    if (response.statusCode == 200) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.setInt('user_id', session['user']['id']);
      await preferences.setString('name', session['user']['name']);
      await preferences.setString('email', session['user']['email']);
      await preferences.setString('token', session['token']);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(session['message'] ?? 'Login failed'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            ClipPath(
              clipBehavior: Clip.antiAlias,
              clipper: CustomBannerClipper(),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(235, 226, 211, 1.0),
                      Color.fromRGBO(247, 229, 205, 1.0),
                    ],
                  ),
                  image: DecorationImage(
                    image:
                        AssetImage('assets/images/LoginMobileBackground.png'),
                    alignment: Alignment.center,
                    fit: BoxFit.cover,
                  ),
                ),
                height: 285,
                width: double.infinity,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 280),
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Masuk',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      'Email',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 4.0),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: 'youremail@email.com',
                        fillColor: kTextFormFieldColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Kata Sandi',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 4.0),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        fillColor: kTextFormFieldColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgetPasswordPage(),
                          ),
                        );
                      },
                      child: Text(
                        'Lupa Kata Sandi?',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: const Color.fromRGBO(82, 113, 255, 1.0),
                            ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _login();
                          }
                        },
                        style: primaryButtonStyle,
                        child: Text(
                          'Masuk',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
