import 'package:flutter/material.dart';
import 'package:sales_app/constants.dart';
import 'package:sales_app/pages/login/login_page.dart';

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({super.key});

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repasswordController = TextEditingController();
  bool _obscureText1 = true;
  bool _obscureText2 = true;
  bool checkpass = true;

  void _submit() {
    setState(() {
      if (_passwordController.text == _repasswordController.text) {
        checkpass = true;
        debugPrint('Password: ${_passwordController.text}');
        debugPrint('RePassword: ${_repasswordController.text}');
        debugPrint('$checkpass');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const NewPassInfoPage()),
        );
      } else {
        checkpass = false;
        debugPrint('Password: ${_passwordController.text}');
        debugPrint('RePassword: ${_repasswordController.text}');
        debugPrint('$checkpass');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                    alignment: Alignment.topCenter,
                    fit: BoxFit.cover,
                  ),
                ),
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kata Sandi Baru',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Kata Sandi',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _obscureText1,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        fillColor: kTextFormFieldColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText1
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText1 = !_obscureText1;
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
                    const SizedBox(height: 16),
                    Text(
                      'Ulangi Kata Sandi',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    TextFormField(
                      controller: _repasswordController,
                      obscureText: _obscureText2,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        fillColor: kTextFormFieldColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText2
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText2 = !_obscureText2;
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
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _submit,
                        style: primaryButtonStyle,
                        child: Text(
                          'Kirim',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    if (checkpass == false)
                      Center(
                          child: Text(
                        'Password tidak sama.',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: kErrorColor),
                        textAlign: TextAlign.center,
                      ))
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

class NewPassInfoPage extends StatelessWidget {
  const NewPassInfoPage({super.key});

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
              const Text('Kata sandi baru anda telah berhasil dibuat.',
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
                          builder: (context) => const LoginPage()),
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
