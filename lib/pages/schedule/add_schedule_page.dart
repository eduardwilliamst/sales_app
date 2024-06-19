//-1 backend
import 'package:flutter/material.dart';
import 'package:sales_app/constants.dart';
import 'package:sales_app/pages/schedule/schedule_page.dart';

class AddSchedulePage extends StatefulWidget {
  const AddSchedulePage({super.key});

  @override
  State<AddSchedulePage> createState() => _AddSchedulePageState();
}

class _AddSchedulePageState extends State<AddSchedulePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _eventNameController = TextEditingController();
  final TextEditingController _customerNameController = TextEditingController();
  final TextEditingController _placeController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  final TextEditingController _dateTimeController = TextEditingController();
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();

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
          end: Alignment.center,
          colors: [
            Color.fromRGBO(212, 232, 231, 1.0),
            Color.fromRGBO(247, 229, 205, 1.0)
          ],
          stops: [0.0, 0.7],
        ),
        image: DecorationImage(
          image: AssetImage('assets/images/SchedulePageBackground.png'),
          alignment: Alignment.topRight,
          // fit: BoxFit.fitWidth,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              'Buat Jadwal Baru',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SchedulePage(),
                    ),
                  );
                },
                icon: Image.asset(
                  'assets/images/close-square.png',
                  height: 30,
                ),
              ),
            ]),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(242, 242, 242, 0.4),
                          borderRadius: BorderRadius.circular(10)),
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
                                    'Judul',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  const SizedBox(
                                    height: 4.0,
                                  ),
                                  TextFormField(
                                    controller: _eventNameController,
                                    decoration: InputDecoration(
                                      hintText: 'Masukkan nama event',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      filled: true,
                                      fillColor: kTextFormFieldColor,
                                    ),
                                    keyboardType: TextInputType.text,
                                  ),
                                  const SizedBox(height: 16.0),
                                  Text(
                                    'Nama Customer',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  const SizedBox(
                                    height: 4.0,
                                  ),
                                  TextFormField(
                                    controller: _customerNameController,
                                    decoration: InputDecoration(
                                        hintText: 'Nama Customer',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        filled: true,
                                        fillColor: kTextFormFieldColor),
                                    keyboardType: TextInputType.name,
                                  ),
                                  const SizedBox(height: 16.0),
                                  Text(
                                    'Tempat',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  const SizedBox(
                                    height: 4.0,
                                  ),
                                  TextFormField(
                                    controller: _placeController,
                                    decoration: InputDecoration(
                                        hintText: 'Alamat/Nama temoat',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        filled: true,
                                        fillColor: kTextFormFieldColor),
                                    keyboardType: TextInputType.streetAddress,
                                  ),
                                  const SizedBox(height: 16.0),
                                  Text(
                                    'Catatan',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  const SizedBox(
                                    height: 4.0,
                                  ),
                                  TextFormField(
                                    controller: _notesController,
                                    decoration: InputDecoration(
                                        hintText: 'Masukkan catatan',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        filled: true,
                                        fillColor: kTextFormFieldColor),
                                    keyboardType: TextInputType.text,
                                    minLines: 5,
                                    maxLines: null,
                                  ),
                                  const SizedBox(height: 16.0),
                                  Text(
                                    'Tanggal',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  const SizedBox(
                                    height: 4.0,
                                  ),
                                  TextField(
                                    controller: _dateTimeController,
                                    decoration: InputDecoration(
                                      hintText: 'Select Date and Time',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      filled: true,
                                      fillColor: kTextFormFieldColor,
                                      suffixIcon:
                                          const Icon(Icons.calendar_today),
                                    ),
                                    keyboardType: TextInputType.datetime,
                                    readOnly: true,
                                    onTap: () => _selectDateTime(
                                        context, _dateTimeController),
                                  ),
                                  const SizedBox(height: 16.0),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Mulai',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge,
                                            ),
                                            const SizedBox(
                                              height: 4.0,
                                            ),
                                            TextField(
                                              controller: _startTimeController,
                                              decoration: InputDecoration(
                                                hintText: 'Jam Mulai',
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                filled: true,
                                                fillColor: kTextFormFieldColor,
                                                suffixIcon: const Icon(
                                                    Icons.access_time),
                                              ),
                                              readOnly: true,
                                              onTap: () => _selectTime(context,
                                                  _startTimeController),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 16.0),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Selesai',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge,
                                            ),
                                            const SizedBox(
                                              height: 4.0,
                                            ),
                                            TextField(
                                              controller: _endTimeController,
                                              decoration: InputDecoration(
                                                hintText: 'Jam Selesai',
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                filled: true,
                                                fillColor: kTextFormFieldColor,
                                                suffixIcon: const Icon(
                                                    Icons.access_time),
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
                                  const SizedBox(height: 32),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          // Perform login action
                                          debugPrint(
                                              'Email: ${_eventNameController.text}');
                                          debugPrint(
                                              'Password: ${_customerNameController.text}');
                                          Navigator.pushReplacementNamed(
                                              context, '/home');
                                        }
                                      },
                                      style: primaryButtonStyle,
                                      child: Text(
                                        'Simpan',
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
                      ))
                ],
              ),
            ),
          ),
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
