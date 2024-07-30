import 'package:flutter/material.dart';
import 'package:sales_app/constants.dart';

class SPHDataPage extends StatefulWidget {
  const SPHDataPage({super.key});

  @override
  State<SPHDataPage> createState() => _SPHDataPageState();
}

class _SPHDataPageState extends State<SPHDataPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _salesNameController = TextEditingController();
  final TextEditingController _customerNameController = TextEditingController();
  final TextEditingController _kavlingController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _dateTimeBrochureController =
      TextEditingController();
  final TextEditingController _dateTimeOfferController =
      TextEditingController();
  final TextEditingController _brochurePriceController =
      TextEditingController();
  final TextEditingController _offerPriceController = TextEditingController();
  final TextEditingController _bookingFeeController = TextEditingController();
  final TextEditingController _downPaymentController = TextEditingController();
  final TextEditingController _downPaymentTenorController =
      TextEditingController();
  final TextEditingController _gimmickController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  String? _selectedPaymentMethod;
  bool accepted = false;
  bool ongoing = true;
  bool rejected = false;
  bool manager = true;

  final List<Map<String, dynamic>> _paymentMethod = [
    {
      'icon': Icons.attach_money,
      'text': 'Metode Pembayaran 1',
    },
    {
      'icon': Icons.attach_money,
      'text': 'Metode Pembayaran 2',
    },
    {
      'icon': Icons.attach_money,
      'text': 'Metode Pembayaran 3',
    },
  ];
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
          alignment: Alignment.bottomRight,
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
            'Detail SPH',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (manager == true) ...[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      kDefaultPadding,
                      0,
                      kDefaultPadding,
                      kDefaultPadding,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LayoutBuilder(
                            builder: (context, constraints) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  if (ongoing == true) ...[
                                    SizedBox(
                                      height: 40,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: kSuccessColor,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8),
                                          shape: const CircleBorder(),
                                        ),
                                        child: const Icon(
                                          Icons.check,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: kErrorColor,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8),
                                          shape: const CircleBorder(),
                                        ),
                                        child: const Icon(
                                          Icons.close,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ] else ...[
                                    if (accepted == true &&
                                        rejected == false) ...[
                                      SizedBox(
                                        width: constraints.maxWidth * 0.3,
                                        height: 40,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          style: successButtonStyle,
                                          child: Text(
                                            'Disetujui',
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelLarge,
                                          ),
                                        ),
                                      ),
                                    ] else if (accepted == false &&
                                        rejected == true) ...[
                                      SizedBox(
                                        width: constraints.maxWidth * 0.3,
                                        height: 40,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          style: errorButtonStyle,
                                          child: Text(
                                            'Ditolak',
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelLarge,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ],
                                ],
                              );
                            },
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          Text(
                            'Sales',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const SizedBox(
                            height: 4.0,
                          ),
                          TextFormField(
                            controller: _salesNameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              filled: true,
                              fillColor: kTextFormFieldColor,
                            ),
                            keyboardType: TextInputType.name,
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          Text(
                            'Customer',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const SizedBox(
                            height: 4.0,
                          ),
                          TextFormField(
                            controller: _customerNameController,
                            decoration: InputDecoration(
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
                            'Kavling',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const SizedBox(
                            height: 4.0,
                          ),
                          TextFormField(
                            controller: _kavlingController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              filled: true,
                              fillColor: kTextFormFieldColor,
                            ),
                            readOnly: true,
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
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              filled: true,
                              fillColor: kTextFormFieldColor,
                            ),
                            readOnly: true,
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
                          const SizedBox(
                            height: 16.0,
                          ),
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
                            keyboardType: const TextInputType.numberWithOptions(
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
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          Text(
                            'Metode Pembayaran',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const SizedBox(
                            height: 4.0,
                          ),
                          DropdownButtonFormField<String>(
                            value: _selectedPaymentMethod,
                            hint: const Text('Metode Pembayaran'),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              filled: true,
                              fillColor: kTextFormFieldColor,
                            ),
                            items: _paymentMethod.map((method) {
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
                            validator: (value) =>
                                value == null ? 'Please select status' : null,
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
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
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              filled: true,
                              fillColor: kTextFormFieldColor,
                            ),
                            readOnly: true,
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,
                            ),
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
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              filled: true,
                              fillColor: kTextFormFieldColor,
                            ),
                            readOnly: true,
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                          ),
                          const SizedBox(height: 16.0),
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
                            keyboardType: const TextInputType.numberWithOptions(
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
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                            minLines: 5,
                            maxLines: null,
                          ),
                        ],
                      ),
                    ),
                  ),
                ] else ...[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      kDefaultPadding,
                      0,
                      kDefaultPadding,
                      kDefaultPadding,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LayoutBuilder(
                            builder: (context, constraints) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  if (accepted == true &&
                                      ongoing == false &&
                                      rejected == false) ...[
                                    SizedBox(
                                      width: constraints.maxWidth * 0.3,
                                      height: 40,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: successButtonStyle,
                                        child: Text(
                                          'Disetujui',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge,
                                        ),
                                      ),
                                    ),
                                  ] else if (accepted == false &&
                                      ongoing == false &&
                                      rejected == true) ...[
                                    SizedBox(
                                      width: constraints.maxWidth * 0.3,
                                      height: 40,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: errorButtonStyle,
                                        child: Text(
                                          'Ditolak',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge,
                                        ),
                                      ),
                                    ),
                                  ] else if (accepted == false &&
                                      ongoing == true &&
                                      rejected == false) ...[
                                    SizedBox(
                                      width: constraints.maxWidth * 0.3,
                                      height: 40,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: warningButtonStyle,
                                        child: Text(
                                          'Ongoing',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge!
                                              .copyWith(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ]
                                ],
                              );
                            },
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          Text(
                            'Sales',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const SizedBox(
                            height: 4.0,
                          ),
                          TextFormField(
                            controller: _salesNameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              filled: true,
                              fillColor: kTextFormFieldColor,
                            ),
                            keyboardType: TextInputType.name,
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          Text(
                            'Customer',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const SizedBox(
                            height: 4.0,
                          ),
                          TextFormField(
                            controller: _customerNameController,
                            decoration: InputDecoration(
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
                            'Kavling',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const SizedBox(
                            height: 4.0,
                          ),
                          TextFormField(
                            controller: _kavlingController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              filled: true,
                              fillColor: kTextFormFieldColor,
                            ),
                            readOnly: true,
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
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              filled: true,
                              fillColor: kTextFormFieldColor,
                            ),
                            readOnly: true,
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
                          const SizedBox(
                            height: 16.0,
                          ),
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
                            keyboardType: const TextInputType.numberWithOptions(
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
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          Text(
                            'Metode Pembayaran',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const SizedBox(
                            height: 4.0,
                          ),
                          DropdownButtonFormField<String>(
                            value: _selectedPaymentMethod,
                            hint: const Text('Metode Pembayaran'),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              filled: true,
                              fillColor: kTextFormFieldColor,
                            ),
                            items: _paymentMethod.map((method) {
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
                            validator: (value) =>
                                value == null ? 'Please select status' : null,
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
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
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              filled: true,
                              fillColor: kTextFormFieldColor,
                            ),
                            readOnly: true,
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,
                            ),
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
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              filled: true,
                              fillColor: kTextFormFieldColor,
                            ),
                            readOnly: true,
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                          ),
                          const SizedBox(height: 16.0),
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
                            keyboardType: const TextInputType.numberWithOptions(
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
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                            minLines: 5,
                            maxLines: null,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
