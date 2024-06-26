import 'package:flutter/material.dart';
import 'package:sales_app/constants.dart';
import 'package:sales_app/pages/forget_password/new_pass_page.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

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
                      Color.fromRGBO(247, 229, 205, 1.0)
                    ],
                    // stops: [
                    //   0.0,
                    //   1.0,
                    // ],
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
              margin: const EdgeInsets.only(top: 260),
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lupa Kata Sandi',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Email',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: 'Please enter your email',
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
                    const SizedBox(height: 8),
                    Text(
                      'Kami akan mengirim email untuk pemulihan akun Anda.',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Perform password recovery action
                            debugPrint('Email: ${_emailController.text}');
                          }
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ForgetPassInfoPage()),
                          );
                        },
                        style: primaryButtonStyle,
                        child: Text(
                          'Kirim',
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
                  style: primaryButtonStyle,
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
