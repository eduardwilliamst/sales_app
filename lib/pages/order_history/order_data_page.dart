import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:sales_app/constants.dart';
import 'package:sales_app/pages/home/home_page.dart';

class OrderDataPage extends StatefulWidget {
  const OrderDataPage({super.key});

  @override
  State<OrderDataPage> createState() => _OrderDataPageState();
}

class _OrderDataPageState extends State<OrderDataPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _kavlingController = TextEditingController();
  final TextEditingController _customerNameController = TextEditingController();
  final TextEditingController _bookingFeeController = TextEditingController();
  final TextEditingController _historySPHController = TextEditingController();
  final TextEditingController _proofOfBookingFeeController =
      TextEditingController();
  String? _selectedStatusSPH;
  String? _selectedStatusSPR;
  bool _editKavling = true;
  bool _editBookingFee = true;
  final bool _editBookingFeeProof = true;
  final bool _editHistorySPH = true;
  final bool _proofOfBookingFee = false;
  // String? _uploadedFileName;
  // String? _uploadedFilePath;
  // String? _uploadedFileBytes;
  // late int _uploadedFileSize = 0;
  // double bytesValue = 0;

  final List<Map<String, dynamic>> _status = [
    {
      'icon': Icons.check,
      'text': 'Status 1',
    },
    {
      'icon': Icons.close,
      'text': 'Status 2',
    },
    {
      'icon': Icons.autorenew,
      'text': 'Status 3',
    },
  ];
  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    // _uploadedFileSize = 0;
    // _uploadedFileBytes = '';
    // bytesValue = 0;
    if (result != null && result.files.single.path != null) {
      setState(() {
        // _uploadedFileName = result.files.single.name;
        // _uploadedFilePath = result.files.single.path;
        // _uploadedFileSize = result.files.single.size;
        // bytesValue = _uploadedFileSize.toDouble() / 1000;
        // if (bytesValue < 1000) {
        //   _uploadedFileBytes = 'kB';
        // } else if (_uploadedFileSize > 1000000) {
        //   _uploadedFileBytes = 'MB';
        //   bytesValue = bytesValue / 1000;
        // }
      });
    } else {
      // User canceled the picker or path is null
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/OrderHistoryBackground.png'),
          fit: BoxFit.cover,
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
                              IconButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const HomePage(
                                              initialIndex: 1,
                                            )),
                                  );
                                },
                                icon: Image.asset(
                                    'assets/images/arrow-left.png',
                                    height: 30),
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
                                  const SizedBox(height: 16.0),
                                  Text(
                                    'Kavling',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  TextFormField(
                                    controller: _kavlingController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      filled: true,
                                      fillColor: kTextFormFieldColor,
                                      suffixIcon: InkWell(
                                        onTap: () {
                                          setState(() {
                                            _editKavling = !_editKavling;
                                          });
                                        },
                                        child: Image.asset(
                                          'assets/images/edit-outlined.png',
                                          height: 30,
                                        ),
                                      ),
                                    ),
                                    readOnly: _editKavling,
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
                                    controller: _bookingFeeController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      filled: true,
                                      fillColor: kTextFormFieldColor,
                                      suffixIcon: InkWell(
                                        onTap: () {
                                          setState(() {
                                            _editBookingFee = !_editBookingFee;
                                          });
                                        },
                                        child: Image.asset(
                                          'assets/images/edit-outlined.png',
                                          height: 30,
                                        ),
                                      ),
                                    ),
                                    readOnly: _editBookingFee,
                                    keyboardType:
                                        const TextInputType.numberWithOptions(
                                      decimal: true,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  if (_proofOfBookingFee == false) ...[
                                    Text(
                                      'Upload Bukti UTJ',
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
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
                                  ] else ...[
                                    Text(
                                      'Bukti UTJ',
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    TextFormField(
                                      controller: _proofOfBookingFeeController,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        filled: true,
                                        fillColor: kTextFormFieldColor,
                                        suffixIcon: InkWell(
                                          onTap: _pickFile,
                                          child: Image.asset(
                                            'assets/images/edit-outlined.png',
                                            height: 30,
                                          ),
                                        ),
                                      ),
                                      readOnly: _editBookingFeeProof,
                                      keyboardType: TextInputType.text,
                                    ),
                                  ],
                                  const SizedBox(height: 16.0),
                                  Text(
                                    'History SPH',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  TextFormField(
                                    controller: _historySPHController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      filled: true,
                                      fillColor: kTextFormFieldColor,
                                      suffixIcon: InkWell(
                                        onTap: _pickFile,
                                        child: Image.asset(
                                          'assets/images/edit-outlined.png',
                                          height: 30,
                                        ),
                                      ),
                                    ),
                                    readOnly: _editHistorySPH,
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                  const SizedBox(height: 16.0),
                                  Text(
                                    'Status SPH',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  DropdownButtonFormField<String>(
                                    value: _selectedStatusSPH,
                                    hint: const Text('Pilih status SPH'),
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      filled: true,
                                      fillColor: kTextFormFieldColor,
                                    ),
                                    items: _status.map((method) {
                                      return DropdownMenuItem<String>(
                                        value: method['text'],
                                        child: Row(
                                          children: [
                                            Icon(method['icon']),
                                            const SizedBox(width: 8),
                                            Text(method['text']),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        _selectedStatusSPH = newValue;
                                      });
                                    },
                                    validator: (value) => value == null
                                        ? 'Please select status'
                                        : null,
                                  ),
                                  const SizedBox(
                                    height: 16.0,
                                  ),
                                  Text(
                                    'Status SPR',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  DropdownButtonFormField<String>(
                                    value: _selectedStatusSPR,
                                    hint: const Text('Pilih status SPH'),
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      filled: true,
                                      fillColor: kTextFormFieldColor,
                                    ),
                                    items: _status.map((method) {
                                      return DropdownMenuItem<String>(
                                        value: method['text'],
                                        child: Row(
                                          children: [
                                            Icon(method['icon']),
                                            const SizedBox(width: 8),
                                            Text(method['text']),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        _selectedStatusSPR = newValue;
                                      });
                                    },
                                    validator: (value) => value == null
                                        ? 'Please select status'
                                        : null,
                                  ),
                                  const SizedBox(height: 32.0),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          // Perform login action
                                          debugPrint(
                                              'Kavling ${_kavlingController.text}');
                                          debugPrint(
                                              'Customer: ${_customerNameController.text}');
                                          debugPrint(
                                              'UTJ: ${_bookingFeeController.text}');
                                          debugPrint(
                                              'Status SPH: $_selectedStatusSPH');
                                          debugPrint(
                                              'Status SPR: $_selectedStatusSPR');
                                          Navigator.pushReplacementNamed(
                                              context, '/home');
                                        }
                                      },
                                      style: primaryButtonStyle,
                                      child: Text(
                                        'Simpan Perubahan',
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

class Event {
  final String title;

  const Event(this.title);

  @override
  String toString() => title;
}
