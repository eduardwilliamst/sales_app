import 'package:flutter/material.dart';
import 'package:sales_app/home_page.dart';
import 'package:sales_app/login_page.dart';
import 'package:sales_app/reset_pass_page.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                elevation: 5,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(16, 16, 16, 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    image: DecorationImage(
                      image: AssetImage('assets/images/Background.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()),
                              );
                            },
                            icon: Image.asset('assets/images/arrow-left.png',
                                height: 25),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'Profilku',
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  AssetImage('assets/images/Logos.png'),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Salesman 1',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(127, 212, 232, 231),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/crown.png',
                            height: 25,
                          ),
                          SizedBox(height: 10),
                          Text(
                            '72 POIN SILVER',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Email',
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFF5F5F5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Kata Sandi',
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFF5F5F5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        suffixIcon: IconButton(
                          icon: Image.asset(
                            'assets/images/edit-outlined.png',
                            height: 25,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ResetPasswordPage()),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        textStyle: TextStyle(fontSize: 16),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Icon(Icons.logout),
                            ),
                          ),
                          Center(
                            child: Text(
                              'Keluar',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
