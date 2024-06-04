import 'package:flutter/material.dart';
import 'package:sales_app/login_page.dart';
import 'package:sales_app/new_pass_page.dart';

class ForgetPassInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/Success.png', width: 200, height: 200),
              SizedBox(height: 20),
              Text('Silakan cek email untuk mengatur kata sandi baru Anda',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold)
                  //Theme.of(context).textTheme.bodyMedium,
                  ),
              SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NewPasswordPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(164, 114, 61, 1),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Kembali',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
