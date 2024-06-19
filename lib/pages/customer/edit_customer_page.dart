import 'package:flutter/material.dart';
import 'package:sales_app/constants.dart';
import 'package:sales_app/pages/home/home_page.dart';

class EditCustomerPage extends StatefulWidget {
  const EditCustomerPage({super.key});

  @override
  State<EditCustomerPage> createState() => _EditCustomerPageState();
}

class _EditCustomerPageState extends State<EditCustomerPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _provinceController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _sourceController = TextEditingController();
  bool _editCustomerName = true;
  bool _editPhoneNumber = true;
  bool _editEmail = true;
  bool _editProvince = true;
  bool _editCity = true;
  bool _editSource = true;
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
            ]),
        image: DecorationImage(
          image: AssetImage('assets/images/EditCustomerBackground.png'),
          alignment: Alignment.topRight,
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
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const HomePage(
                          initialIndex: 4,
                        )),
              );
            },
            icon: Image.asset('assets/images/arrow-left.png', height: 30),
          ),
          title: Text(
            'Edit Customer',
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
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _editCustomerName = !_editCustomerName;
                                      });
                                    },
                                    child: Image.asset(
                                      'assets/images/edit-outlined.png',
                                      height: 30,
                                    ),
                                  ),
                                ),
                                readOnly: _editCustomerName,
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
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _editPhoneNumber = !_editPhoneNumber;
                                      });
                                    },
                                    child: Image.asset(
                                      'assets/images/edit-outlined.png',
                                      height: 30,
                                    ),
                                  ),
                                ),
                                readOnly: _editPhoneNumber,
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
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _editEmail = !_editEmail;
                                      });
                                    },
                                    child: Image.asset(
                                      'assets/images/edit-outlined.png',
                                      height: 30,
                                    ),
                                  ),
                                ),
                                readOnly: _editEmail,
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
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _editProvince = !_editProvince;
                                      });
                                    },
                                    child: Image.asset(
                                      'assets/images/edit-outlined.png',
                                      height: 30,
                                    ),
                                  ),
                                ),
                                readOnly: _editProvince,
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
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _editCity = !_editCity;
                                      });
                                    },
                                    child: Image.asset(
                                      'assets/images/edit-outlined.png',
                                      height: 30,
                                    ),
                                  ),
                                ),
                                readOnly: _editCity,
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
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _editSource = !_editSource;
                                      });
                                    },
                                    child: Image.asset(
                                      'assets/images/edit-outlined.png',
                                      height: 30,
                                    ),
                                  ),
                                ),
                                readOnly: _editSource,
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
                                          'Email: ${_nameController.text}');
                                      debugPrint(
                                          'Password: ${_phoneNumberController.text}');
                                      Navigator.pushReplacementNamed(
                                          context, '/home');
                                    }
                                  },
                                  style: primaryButtonStyle,
                                  child: Text(
                                    'Simpan Perubahan',
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
