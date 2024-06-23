import 'package:flutter/material.dart';
import 'package:sales_app/constants.dart';
import 'package:sales_app/pages/home/home_page.dart';

class FormSPH1Page extends StatefulWidget {
  const FormSPH1Page({super.key});

  @override
  State<FormSPH1Page> createState() => _FormSPH1PageState();
}

class _FormSPH1PageState extends State<FormSPH1Page> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _kavlingController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _dateTimeBrochureController =
      TextEditingController();
  final TextEditingController _dateTimeOfferController =
      TextEditingController();
  final TextEditingController _brochurePriceController =
      TextEditingController();
  final TextEditingController _offerPriceController = TextEditingController();

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != DateTime.now()) {
      setState(() {
        controller.text = "${pickedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(235, 226, 211, 1.0),
            Color.fromRGBO(212, 232, 231, 1.0)
          ],
          stops: [0.35, 1.0],
        ),
        image: DecorationImage(
          image: AssetImage('assets/images/FormSPHBackground.png'),
          alignment: Alignment.bottomCenter,
          fit: BoxFit.fitWidth,
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
            'Form SPH',
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
                                'Kavling',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const SizedBox(
                                height: 4.0,
                              ),
                              TextFormField(
                                controller: _kavlingController,
                                decoration: InputDecoration(
                                  hintText: 'Masukkan nama',
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
                                'Alamat',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const SizedBox(
                                height: 4.0,
                              ),
                              TextFormField(
                                controller: _addressController,
                                decoration: InputDecoration(
                                  hintText: 'Masukkan nomor telepon',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  filled: true,
                                  fillColor: kTextFormFieldColor,
                                ),
                                keyboardType: TextInputType.streetAddress,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Tanggal Brosur',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const SizedBox(
                                height: 4.0,
                              ),
                              TextFormField(
                                controller: _dateTimeBrochureController,
                                decoration: InputDecoration(
                                  hintText: 'Tanggal brosur',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  filled: true,
                                  fillColor: kTextFormFieldColor,
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      _selectDate(
                                          context, _dateTimeBrochureController);
                                    },
                                    child: const Icon(Icons.date_range_rounded),
                                  ),
                                ),
                                keyboardType: TextInputType.datetime,
                                readOnly: true,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Tanggal Pembuatan',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const SizedBox(
                                height: 4.0,
                              ),
                              TextFormField(
                                controller: _dateTimeOfferController,
                                decoration: InputDecoration(
                                  hintText: 'Tanggal pembuatan',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  filled: true,
                                  fillColor: kTextFormFieldColor,
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      _selectDate(
                                          context, _dateTimeBrochureController);
                                    },
                                    child: const Icon(Icons.date_range_rounded),
                                  ),
                                ),
                                keyboardType: TextInputType.datetime,
                                readOnly: true,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Harga Brosur',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const SizedBox(
                                height: 4.0,
                              ),
                              TextFormField(
                                controller: _brochurePriceController,
                                decoration: InputDecoration(
                                  hintText: 'Harga brosur',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  filled: true,
                                  fillColor: kTextFormFieldColor,
                                ),
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        decimal: true),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Harga Penawaran',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const SizedBox(
                                height: 4.0,
                              ),
                              TextFormField(
                                controller: _offerPriceController,
                                decoration: InputDecoration(
                                  hintText: 'Harga Penawaran',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  filled: true,
                                  fillColor: kTextFormFieldColor,
                                ),
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        decimal: true),
                              ),
                              const SizedBox(height: 24.0),
                              Align(
                                alignment: Alignment.centerRight,
                                child: SizedBox(
                                  width: 150,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        // Perform login action
                                        debugPrint(
                                            'Kavling: ${_kavlingController.text}');
                                        debugPrint(
                                            'Alamat: ${_addressController.text}');
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const FormSPH2Page(),
                                          ),
                                        );
                                      }
                                    },
                                    style: primaryButtonStyle,
                                    child: Text(
                                      'Selanjutnya',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
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

class FormSPH2Page extends StatefulWidget {
  const FormSPH2Page({super.key});

  @override
  State<FormSPH2Page> createState() => _FormSPH2PageState();
}

class _FormSPH2PageState extends State<FormSPH2Page> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _paymentMethodController =
      TextEditingController();
  final TextEditingController _bookingFeeController = TextEditingController();
  final TextEditingController _downPaymentController = TextEditingController();
  final TextEditingController _downPaymentTenorController =
      TextEditingController();
  final TextEditingController _gimmickController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  String? _selectedPaymentMethod;
  final List<Map<String, dynamic>> _paymentMethods = [
    {
      'icon': Icons.credit_card,
      'text': 'Credit Card',
    },
    {
      'icon': Icons.account_balance,
      'text': 'Bank Transfer',
    },
    {
      'icon': Icons.money,
      'text': 'Cash',
    },
    {
      'icon': Icons.install_mobile,
      'text': 'Installment',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(235, 226, 211, 1.0),
              Color.fromRGBO(212, 232, 231, 1.0)
            ],
            stops: [
              0.35,
              1.0
            ]),
        image: DecorationImage(
          image: AssetImage('assets/images/FormSPHBackground.png'),
          alignment: Alignment.bottomRight,
          fit: BoxFit.fitWidth,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                              const SizedBox(height: 24.0),
                              Text(
                                'Metode Pembayaran',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const SizedBox(
                                height: 4.0,
                              ),
                              DropdownButtonFormField<String>(
                                value: _selectedPaymentMethod,
                                hint: const Text('Pilih Metode Pembayaran'),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  filled: true,
                                  fillColor: kTextFormFieldColor,
                                ),
                                items: _paymentMethods.map((method) {
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
                                    _selectedPaymentMethod = newValue;
                                  });
                                },
                                validator: (value) => value == null
                                    ? 'Please select a payment method'
                                    : null,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'UTJ',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const SizedBox(
                                height: 4.0,
                              ),
                              TextFormField(
                                controller: _bookingFeeController,
                                decoration: InputDecoration(
                                  hintText: 'Masukkan nomor telepon',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  filled: true,
                                  fillColor: kTextFormFieldColor,
                                ),
                                keyboardType: TextInputType.streetAddress,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Uang Muka (DP)',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const SizedBox(
                                height: 4.0,
                              ),
                              TextFormField(
                                controller: _downPaymentController,
                                decoration: InputDecoration(
                                  hintText: 'Tanggal brosur',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  filled: true,
                                  fillColor: kTextFormFieldColor,
                                ),
                                keyboardType: TextInputType.datetime,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Tenor DP',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const SizedBox(
                                height: 4.0,
                              ),
                              TextFormField(
                                controller: _downPaymentTenorController,
                                decoration: InputDecoration(
                                  hintText: 'Tanggal pembuatan',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  filled: true,
                                  fillColor: kTextFormFieldColor,
                                ),
                                keyboardType: TextInputType.datetime,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Gimmick',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const SizedBox(
                                height: 4.0,
                              ),
                              TextFormField(
                                controller: _gimmickController,
                                decoration: InputDecoration(
                                  hintText: 'Harga brosur',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  filled: true,
                                  fillColor: kTextFormFieldColor,
                                ),
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        decimal: true),
                                minLines: 5,
                                maxLines: null,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Catatan',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const SizedBox(
                                height: 4.0,
                              ),
                              TextFormField(
                                controller: _notesController,
                                decoration: InputDecoration(
                                  hintText: 'Harga Penawaran',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  filled: true,
                                  fillColor: kTextFormFieldColor,
                                ),
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        decimal: true),
                                minLines: 5,
                                maxLines: null,
                              ),
                              const SizedBox(height: 24.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const FormSPH1Page(),
                                          ),
                                        );
                                      },
                                      style: secondaryButtonStyle,
                                      child: Text(
                                        'Kembali',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge!
                                            .copyWith(color: kPrimaryColor),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 16.0,
                                  ),
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          // Perform login action
                                          debugPrint(
                                              'Email: ${_paymentMethodController.text}');
                                          debugPrint(
                                              'Password: ${_bookingFeeController.text}');
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const HomePage(
                                                      initialIndex: 2),
                                            ),
                                          );
                                        }
                                      },
                                      style: primaryButtonStyle,
                                      child: Text(
                                        'Buat',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge,
                                      ),
                                    ),
                                  ),
                                ],
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
