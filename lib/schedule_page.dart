// kurang back end

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:sales_app/constants.dart';
import 'package:sales_app/add_schedule.dart';
import 'package:sales_app/home_page.dart';
import 'package:table_calendar/table_calendar.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  DateTime today = DateTime.now();

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('id_ID', null);
  }

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  String getFormattedDate() {
    return DateFormat('EEEE, d MMMM yyyy', 'id_ID').format(today);
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomePage()),
                                );
                              },
                              icon: Image.asset('assets/images/arrow-left.png',
                                  height: 30),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Kalender',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.all(kDefaultPadding),
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8.0, bottom: 8.0),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: const Color.fromRGBO(122, 167, 165, 100),
                            width: 3.0),
                      ),
                      child: TableCalendar(
                        locale: 'id_ID',
                        rowHeight: 43,
                        headerStyle: const HeaderStyle(
                          formatButtonVisible: false,
                          titleCentered: true,
                        ),
                        availableGestures: AvailableGestures.all,
                        selectedDayPredicate: (day) => isSameDay(day, today),
                        focusedDay: today,
                        firstDay: DateTime.utc(2010, 10, 16),
                        lastDay: DateTime.utc(2030, 3, 14),
                        onDaySelected: _onDaySelected,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(kDefaultPadding),
                      padding: const EdgeInsets.all(kDefaultPadding),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: const Color.fromRGBO(122, 167, 165, 100),
                            width: 3.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Jadwal Hari Ini',
                              style: TextStyle(
                                  fontFamily: 'DMSerifText',
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal)),
                          const SizedBox(height: 5),
                          Text(getFormattedDate(),
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w400)),
                          const SizedBox(height: 10),
                          _buildScheduleItem('13.00 - 14.00', 'Follow Up SPJ',
                              'Nama Customer - Tempat'),
                          _buildScheduleItem('13.00 - 14.00', 'Follow Up SPJ',
                              'Nama Customer - Tempat'),
                          _buildScheduleItem('13.00 - 14.00', 'Follow Up SPJ',
                              'Nama Customer - Tempat')
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: SizedBox(
        width: 100,
        height: 100,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddSchedulePage()),
            );
          }, // Path ke gambar add button Anda
          backgroundColor: Colors
              .transparent, // Menghapus background color untuk membuatnya transparan
          elevation: 0, foregroundColor: kPrimaryColor,
          child: const Icon(
            Icons.add_circle_sharp,
            size: 75,
          ), // Menghapus shadow
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildScheduleItem(String time, String task, String details) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(time,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              Text(task, style: const TextStyle(fontSize: 14)),
              Text(details, style: const TextStyle(fontSize: 14)),
            ],
          ),
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
