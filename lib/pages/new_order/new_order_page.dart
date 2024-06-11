import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:sales_app/constants.dart';
import 'package:sales_app/pages/new_order/form_sph_page.dart';

class NewOrderPage extends StatefulWidget {
  const NewOrderPage({super.key});

  @override
  State<NewOrderPage> createState() => _NewOrderPageState();
}

class _NewOrderPageState extends State<NewOrderPage> {
  final _formKey = GlobalKey<FormState>();
  final _currencyController = MoneyMaskedTextController(
    decimalSeparator: ',',
    thousandSeparator: '.',
    leftSymbol: 'Rp',
  );
  final TextEditingController _kavlingController = TextEditingController();
  final TextEditingController _customerNameController = TextEditingController();
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
          _uploadedFileBytes = 'MB';
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

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(235, 226, 211, 1.0),
            Color.fromRGBO(235, 226, 211, 1.0),
            Color.fromRGBO(244, 244, 244, 1.0)
          ],
          stops: [
            0.0,
            0.5,
            1.0,
          ],
        ),
        image: DecorationImage(
          image: AssetImage('assets/images/OrderPageBackground.png'),
          alignment: Alignment.topLeft,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(kDefaultPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Pesanan Baru',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineLarge),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16.0),
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
                                  const SizedBox(
                                    height: 16.0,
                                  ),
                                  Text(
                                    'Kavling*',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  TextFormField(
                                    controller: _kavlingController,
                                    decoration: InputDecoration(
                                      hintText: 'Masukkan kavling',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      filled: true,
                                      fillColor: kTextFormFieldColor,
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
                                    controller: _customerNameController,
                                    decoration: InputDecoration(
                                      hintText: 'Nama Customer',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      filled: true,
                                      fillColor: kTextFormFieldColor,
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
                                      fillColor: kTextFormFieldColor,
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
                                  if (_uploadedFilePath != null &&
                                      (_uploadedFilePath!
                                              .toLowerCase()
                                              .endsWith('.png') ||
                                          _uploadedFilePath!
                                              .toLowerCase()
                                              .endsWith('.jpg') ||
                                          _uploadedFilePath!
                                              .toLowerCase()
                                              .endsWith('.jpeg'))) ...[
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
                                                  backgroundColor:
                                                      const Color.fromRGBO(
                                                          242, 242, 242, 0.4),
                                                  shape: const CircleBorder(),
                                                  padding: const EdgeInsets.all(
                                                      kDefaultPadding),
                                                ),
                                                child: const Icon(
                                                  Icons.edit_document,
                                                  size: 30,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
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
                                      height: screenHeight * 0.2,
                                      child: ElevatedButton(
                                        onPressed: _pickFile,
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: kTextFormFieldColor,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: kDefaultPadding),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                                'assets/images/document-upload.png'),
                                            const SizedBox(
                                              height: 8.0,
                                            ),
                                            Text('Upload File',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium),
                                          ],
                                        ),
                                      ),
                                    ),
                                  const SizedBox(height: 32),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const FormSPH1Page()),
                                        );
                                      },
                                      style: secondaryButtonStyle,
                                      child: Text(
                                        'Buat SPH',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge!
                                            .copyWith(color: kPrimaryColor),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8.0),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          // Perform login action
                                          debugPrint(
                                              'Email: ${_kavlingController.text}');
                                          debugPrint(
                                              'Password: ${_customerNameController.text}');
                                          Navigator.pushReplacementNamed(
                                              context, '/home');
                                        }
                                      },
                                      style: primaryButtonStyle,
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
          ],
        ),
      ),
    );
  }
}
