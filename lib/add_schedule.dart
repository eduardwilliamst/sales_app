//-1 backend
import 'package:flutter/material.dart';
import 'package:sales_app/constants.dart';
import 'package:sales_app/schedule_page.dart';

class AddSchedulePage extends StatefulWidget {
  const AddSchedulePage({super.key});

  @override
  State<AddSchedulePage> createState() => _AddSchedulePageState();
}

class _AddSchedulePageState extends State<AddSchedulePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _dateTimeController = TextEditingController();
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();

  Future<void> _selectDateTime(BuildContext context) async {
    DateTime selectedDate = DateTime.now();
    TimeOfDay selectedTime = TimeOfDay.now();

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      selectedDate = pickedDate;
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: selectedTime,
      );

      if (pickedTime != null) {
        selectedTime = pickedTime;
        setState(() {
          _dateTimeController.text =
              "${selectedDate.toLocal()} ${selectedTime.format(context)}";
        });
      }
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
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/SchedulePageBackground.png'),
              fit: BoxFit.cover,
            )),
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
                              Text('Buat Jadwal Baru',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black, width: 1.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SchedulePage()),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.close_sharp,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
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
                                    TextFormField(
                                      // controller: _emailController,
                                      decoration: InputDecoration(
                                          hintText: 'Masukkan nama event',
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          filled: true,
                                          fillColor: kSecondaryColor),
                                      keyboardType: TextInputType.text,
                                    ),
                                    const SizedBox(height: 16.0),
                                    Text(
                                      'Nama Customer',
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    TextFormField(
                                      // controller: _passwordController,
                                      decoration: InputDecoration(
                                          hintText: 'Nama Customer',
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          filled: true,
                                          fillColor: kSecondaryColor),
                                      keyboardType: TextInputType.name,
                                    ),
                                    const SizedBox(height: 16.0),
                                    Text(
                                      'Tempat',
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    TextFormField(
                                      // controller: _emailController,
                                      decoration: InputDecoration(
                                          hintText: 'Alamat/Nama temoat',
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          filled: true,
                                          fillColor: kSecondaryColor),
                                      keyboardType: TextInputType.streetAddress,
                                    ),
                                    const SizedBox(height: 16.0),
                                    Text(
                                      'Catatan',
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    TextFormField(
                                        // controller: _passwordController,
                                        decoration: InputDecoration(
                                            hintText: 'Masukkan catatan',
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            filled: true,
                                            fillColor: kSecondaryColor),
                                        keyboardType: TextInputType.text,
                                        minLines: 10,
                                        maxLines: null),
                                    const SizedBox(height: 16.0),
                                    Text(
                                      'Tanggal',
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    TextField(
                                      controller: _dateTimeController,
                                      decoration: InputDecoration(
                                        hintText: 'Select Date and Time',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        filled: true,
                                        fillColor: kSecondaryColor,
                                        suffixIcon:
                                            const Icon(Icons.calendar_today),
                                      ),
                                      keyboardType: TextInputType.datetime,
                                      readOnly: true,
                                      onTap: () => _selectDateTime(context),
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
                                              TextField(
                                                controller:
                                                    _startTimeController,
                                                decoration: InputDecoration(
                                                  hintText: 'Jam Mulai',
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  filled: true,
                                                  fillColor: kSecondaryColor,
                                                  suffixIcon: const Icon(
                                                      Icons.access_time),
                                                ),
                                                readOnly: true,
                                                onTap: () => _selectTime(
                                                    context,
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
                                              TextField(
                                                controller: _endTimeController,
                                                decoration: InputDecoration(
                                                  hintText: 'Jam Selesai',
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  filled: true,
                                                  fillColor: kSecondaryColor,
                                                  suffixIcon: const Icon(
                                                      Icons.access_time),
                                                ),
                                                readOnly: true,
                                                onTap: () => _selectTime(
                                                    context,
                                                    _endTimeController),
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
                                          if (_formKey.currentState!
                                              .validate()) {
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
          )
        ],
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
