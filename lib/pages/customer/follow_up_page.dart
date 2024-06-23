import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sales_app/constants.dart';

class FollowUpPage extends StatefulWidget {
  const FollowUpPage({super.key});

  @override
  State<FollowUpPage> createState() => _FollowUpPageState();
}

class _FollowUpPageState extends State<FollowUpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _dateTimeController = TextEditingController();
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  String? _categoryController = '';
  final bool editFollowUp = true;

  Future<void> _selectDateTime(
      BuildContext context, TextEditingController controller) async {
    DateTime selectedDate = DateTime.now();
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != DateTime.now()) {
      setState(() {
        controller.text = "${pickedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  Future<void> _selectTime(
      BuildContext context, TextEditingController controller) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        controller.text = pickedTime.format(context);
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
            Color.fromRGBO(244, 244, 244, 1.0)
          ],
          stops: [0.5, 1.0],
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
            'Follow Up',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.all(kDefaultPadding),
                  padding: const EdgeInsets.all(kDefaultPadding),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(242, 242, 242, 0.4),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: kSecondaryColor, width: 3.0),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Judul',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                        TextFormField(
                          controller: _titleController,
                          decoration: InputDecoration(
                            hintText: 'Judul',
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
                          'Kategori',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RatingBar.builder(
                              direction: Axis.horizontal,
                              minRating: 1,
                              itemCount: 5,
                              itemPadding: const EdgeInsets.symmetric(
                                horizontal: 4.0,
                              ),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                // debugPrint('$rating');
                                setState(() {
                                  _categoryController = rating.toString();
                                });
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Text(
                          'Tanggal',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                        TextField(
                          controller: _dateTimeController,
                          decoration: InputDecoration(
                            hintText: 'Select Date and Time',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            filled: true,
                            fillColor: kTextFormFieldColor,
                            suffixIcon: const Icon(Icons.calendar_today),
                          ),
                          keyboardType: TextInputType.datetime,
                          readOnly: true,
                          onTap: () =>
                              _selectDateTime(context, _dateTimeController),
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Mulai',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  TextField(
                                    controller: _startTimeController,
                                    decoration: InputDecoration(
                                      hintText: 'Jam Mulai',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      filled: true,
                                      fillColor: kTextFormFieldColor,
                                      suffixIcon: const Icon(Icons.access_time),
                                    ),
                                    readOnly: true,
                                    onTap: () => _selectTime(
                                        context, _startTimeController),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 16.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Selesai',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  TextField(
                                    controller: _endTimeController,
                                    decoration: InputDecoration(
                                      hintText: 'Jam Selesai',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      filled: true,
                                      fillColor: kTextFormFieldColor,
                                      suffixIcon: const Icon(Icons.access_time),
                                    ),
                                    readOnly: true,
                                    onTap: () => _selectTime(
                                        context, _endTimeController),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        if (editFollowUp == true) ...[
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
                                hintText: 'Masukkan catatan',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                filled: true,
                                fillColor: kTextFormFieldColor),
                            keyboardType: TextInputType.text,
                            minLines: 5,
                            maxLines: null,
                          ),
                          const SizedBox(height: 16.0),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  // Perform login action
                                  debugPrint('Judul: ${_titleController.text}');
                                  debugPrint('Kategori: $_categoryController');
                                  debugPrint(
                                      'Tanggal: ${_dateTimeController.text}');
                                  debugPrint(
                                      'Mulai: ${_startTimeController.text}');
                                  debugPrint(
                                      'Sampai: ${_endTimeController.text}');
                                  debugPrint('Catatan: $_notesController');
                                  Navigator.pop(context);
                                }
                              },
                              style: primaryButtonStyle,
                              child: Text(
                                'Simpan Perubahan',
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ),
                          ),
                        ] else ...[
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  // Perform login action
                                  debugPrint('Judul: ${_titleController.text}');
                                  debugPrint('Kategori: $_categoryController');
                                  debugPrint(
                                      'Tanggal: ${_dateTimeController.text}');
                                  debugPrint(
                                      'Mulai: ${_startTimeController.text}');
                                  debugPrint(
                                      'Selesai: ${_endTimeController.text}');
                                  Navigator.pop(context);
                                }
                              },
                              style: primaryButtonStyle,
                              child: Text(
                                'Simpan',
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ),
                          ),
                        ],
                      ],
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
