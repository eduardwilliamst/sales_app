import 'package:flutter/material.dart';
import 'package:sales_app/constants.dart';
import 'package:sales_app/new_pass_page.dart';

class ForgetPassInfoPage extends StatelessWidget {
  const ForgetPassInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/Success.png', width: 200, height: 200),
              const SizedBox(height: 20),
              const Text(
                  'Silakan cek email untuk mengatur kata sandi baru Anda',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold)
                  //Theme.of(context).textTheme.bodyMedium,
                  ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NewPasswordPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    padding:
                        const EdgeInsets.symmetric(vertical: kDefaultPadding),
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
