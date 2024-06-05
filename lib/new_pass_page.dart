import 'package:flutter/material.dart';
import 'package:sales_app/new_pss_info_page.dart';

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({super.key});

  @override
  _NewPasswordPageState createState() => _NewPasswordPageState();
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
        debugPrint("true");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const NewPassInfoPage()),
        );
      } else {
        checkpass = false;
        debugPrint('Password: ${_passwordController.text}');
        debugPrint('RePassword: ${_repasswordController.text}');
        debugPrint("false");
      }
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
                image: AssetImage('assets/images/Background.png'),
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 100),
                      Text(
                        'Kata Sandi Baru',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Kata Sandi',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: _obscureText1,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
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
                      TextFormField(
                        controller: _repasswordController,
                        obscureText: _obscureText2,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
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
                          // {
                          //   if (_formKey.currentState!.validate()) {
                          //     // Perform login action
                          //     print('Password: ${_passwordController.text}');
                          //     print(
                          //         'RePassword: ${_repasswordController.text}');
                          //     Navigator.pushReplacement(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: (context) => NewPassInfoPage()),
                          //     );
                          //   }
                          // },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(164, 114, 61, 1),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
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
                              ?.copyWith(color: Colors.red),
                          textAlign: TextAlign.center,
                        ))
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
