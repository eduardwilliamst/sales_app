import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:sales_app/constants.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final _formKey = GlobalKey<FormState>();
  final _currencyController = MoneyMaskedTextController(
    decimalSeparator: ',',
    thousandSeparator: '.',
    leftSymbol: 'Rp',
  );
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _uploadedFileName;
  String? _uploadedFilePath;
  String? _uploadedFileBytes;
  late int _uploadedFileSize = 0;
  double bytesValue = 0;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    _uploadedFileSize = 0;
    _uploadedFileBytes = '';
    bytesValue = 0;
    if (result != null && result.files.single.path != null) {
      setState(() {
        _uploadedFileName = result.files.single.name;
        _uploadedFilePath = result.files.single.path;
        _uploadedFileSize = result.files.single.size;
        bytesValue = _uploadedFileSize.toDouble() / 1000;
        if (bytesValue < 1000) {
          _uploadedFileBytes = 'kB';
        } else if (_uploadedFileSize > 1000000) {
          _uploadedFileBytes = 'mB';
          bytesValue = bytesValue / 1000;
        }
      });
    } else {
      // User canceled the picker or path is null
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/OrderPageBackground.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                          left: kDefaultPadding, right: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Pesanan Baru',
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32.0),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(242, 242, 242, 0.4),
                        borderRadius: BorderRadius.circular(10),
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
                                  Text(
                                    'Kavling*',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  TextFormField(
                                    // controller: _emailController,
                                    decoration: InputDecoration(
                                      hintText: 'Masukkan nama event',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      filled: true,
                                      fillColor: kSecondaryColor,
                                    ),
                                    keyboardType: TextInputType.text,
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'Customer',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  TextFormField(
                                    // controller: _passwordController,
                                    decoration: InputDecoration(
                                      hintText: 'Nama Customer',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      filled: true,
                                      fillColor: kSecondaryColor,
                                    ),
                                    keyboardType: TextInputType.name,
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'UTJ',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  TextFormField(
                                    controller: _currencyController,
                                    decoration: InputDecoration(
                                      hintText: 'Besaran Uang Tanda Jadi',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      filled: true,
                                      fillColor: kSecondaryColor,
                                    ),
                                    keyboardType:
                                        const TextInputType.numberWithOptions(
                                      decimal: true,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'Upload Bukti UTJ',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  const SizedBox(height: 8),
                                  if (_uploadedFilePath != null &&
                                      (_uploadedFilePath!
                                              .toLowerCase()
                                              .endsWith('.png') ||
                                          _uploadedFilePath!
                                              .toLowerCase()
                                              .endsWith('.jpg') ||
                                          _uploadedFilePath!
                                              .toLowerCase()
                                              .endsWith('.jpeg')))
                                    Center(
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          SizedBox(
                                            width: screenWidth * 0.8,
                                            height: screenHeight * 0.3,
                                            child: Image.file(
                                              File(_uploadedFilePath!),
                                              fit: BoxFit.scaleDown,
                                            ),
                                          ),
                                          Positioned.fill(
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: ElevatedButton(
                                                onPressed: _pickFile,
                                                style: ElevatedButton.styleFrom(
                                                  shape: const CircleBorder(),
                                                  padding: const EdgeInsets.all(
                                                      kDefaultPadding),
                                                ),
                                                child: const Icon(
                                                  Icons.file_upload,
                                                  size: 30,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  if (_uploadedFileName != null) ...[
                                    const SizedBox(height: 8),
                                    Center(
                                      child: Text(
                                        'File: $_uploadedFileName, $bytesValue $_uploadedFileBytes',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                    ),
                                  ],
                                  const SizedBox(height: 8.0),
                                  if (_uploadedFilePath == null)
                                    SizedBox(
                                      width: double.infinity,
                                      height: screenHeight * 0.3,
                                      child: ElevatedButton(
                                        onPressed: _pickFile,
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.transparent,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: kDefaultPadding),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        child: const Icon(Icons.file_upload),
                                      ),
                                    ),
                                  const SizedBox(height: 32),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          // Perform login action
                                          debugPrint(
                                              'Email: ${_emailController.text}');
                                          debugPrint(
                                              'Password: ${_passwordController.text}');
                                          Navigator.pushReplacementNamed(
                                              context, '/home');
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: kSecondaryColor,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: kDefaultPadding),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          side: const BorderSide(
                                            width: 3,
                                            color: kPrimaryColor,
                                          ),
                                        ),
                                      ),
                                      child: const Text(
                                        'Buat SPH',
                                        style: TextStyle(
                                          color: kPrimaryColor,
                                          fontSize: 16,
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16.0),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          // Perform login action
                                          debugPrint(
                                              'Email: ${_emailController.text}');
                                          debugPrint(
                                              'Password: ${_passwordController.text}');
                                          Navigator.pushReplacementNamed(
                                              context, '/home');
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: kPrimaryColor,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: kDefaultPadding),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      child: Text(
                                        'Tambah Pesanan',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge,
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
        ],
      ),
    );
  }
}
