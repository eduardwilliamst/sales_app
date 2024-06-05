import 'package:flutter/material.dart';
import 'package:sales_app/new_pss_info_page.dart';
import 'package:sales_app/profile_page.dart';

class ResetPasswordPage extends StatefulWidget {
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
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
        print('Password: ${_passwordController.text}');
        print('RePassword: ${_repasswordController.text}');
        print(checkpass);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NewPassInfoPage()),
        );
      } else {
        checkpass = false;
        print('Password: ${_passwordController.text}');
        print('RePassword: ${_repasswordController.text}');
        print(checkpass);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 30),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/Background.png'),
                  alignment: Alignment.topCenter,
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
                            MaterialPageRoute(builder: (context) => ProfilePage()),
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
                ],
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 100),
                        Text(
                          'Ubah Kata Sandi',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        SizedBox(height: 16),
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
                        SizedBox(height: 16),
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
                        SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _submit,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(164, 114, 61, 1),
                              padding: EdgeInsets.symmetric(vertical: 16),
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
                        SizedBox(height: 15),
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
      ),
    );
  }
}
