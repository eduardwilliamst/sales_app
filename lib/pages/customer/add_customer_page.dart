import 'package:flutter/material.dart';
import 'package:sales_app/constants.dart';

class AddCustomerPage extends StatefulWidget {
  const AddCustomerPage({super.key});

  @override
  State<AddCustomerPage> createState() => _AddCustomerPageState();
}

class _AddCustomerPageState extends State<AddCustomerPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _provinceController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _sourceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(212, 232, 231, 1.0),
            Color.fromRGBO(235, 226, 211, 1.0)
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset('assets/images/arrow-left.png', height: 30),
          ),
          title: Text(
            'Tambah Customer',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(242, 242, 242, 0.4),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(kDefaultPadding),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 16.0),
                              Text(
                                'Nama',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const SizedBox(
                                height: 4.0,
                              ),
                              TextFormField(
                                controller: _nameController,
                                decoration: InputDecoration(
                                  hintText: 'Masukkan nama',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  filled: true,
                                  fillColor: kTextFormFieldColor,
                                ),
                                keyboardType: TextInputType.name,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Nomor Telepon',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const SizedBox(
                                height: 4.0,
                              ),
                              TextFormField(
                                controller: _phoneNumberController,
                                decoration: InputDecoration(
                                  hintText: 'Masukkan nomor telepon',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  filled: true,
                                  fillColor: kTextFormFieldColor,
                                ),
                                keyboardType: TextInputType.phone,
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
                                  hintText: 'Masukkan email customer',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  filled: true,
                                  fillColor: kTextFormFieldColor,
                                ),
                                keyboardType: TextInputType.emailAddress,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Provinsi',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const SizedBox(
                                height: 4.0,
                              ),
                              TextFormField(
                                controller: _provinceController,
                                decoration: InputDecoration(
                                  hintText: 'Masukkan provinsi',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  filled: true,
                                  fillColor: kTextFormFieldColor,
                                ),
                                keyboardType: TextInputType.text,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Kota',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const SizedBox(
                                height: 4.0,
                              ),
                              TextFormField(
                                controller: _cityController,
                                decoration: InputDecoration(
                                  hintText: 'Masukkan kota',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  filled: true,
                                  fillColor: kTextFormFieldColor,
                                ),
                                keyboardType: TextInputType.text,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Sumber',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const SizedBox(
                                height: 4.0,
                              ),
                              TextFormField(
                                controller: _sourceController,
                                decoration: InputDecoration(
                                  hintText: 'Masukkan sumber',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  filled: true,
                                  fillColor: kTextFormFieldColor,
                                ),
                                keyboardType: TextInputType.text,
                              ),
                              const SizedBox(height: 32.0),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      // Perform login action
                                      debugPrint(
                                          'Customer: ${_nameController.text}');
                                      debugPrint(
                                          'Password: ${_phoneNumberController.text}');

                                      debugPrint(
                                          'Email: ${_emailController.text}');
                                      debugPrint(
                                          'Provinsi: ${_provinceController.text}');
                                      debugPrint(
                                          'Kota: ${_cityController.text}');
                                      debugPrint(
                                          'Sumber: ${_sourceController.text}');
                                      Navigator.pop(context);
                                    }
                                  },
                                  style: primaryButtonStyle,
                                  child: Text(
                                    'Tambah Customer',
                                    style:
                                        Theme.of(context).textTheme.labelLarge,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
