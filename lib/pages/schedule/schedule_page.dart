// kurang back end

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:sales_app/constants.dart';
import 'package:sales_app/pages/schedule/add_schedule_page.dart';
import 'package:sales_app/pages/home/home_page.dart';
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

  String getFormattedDate(DateTime date) {
    return DateFormat('EEEE, d MMMM yyyy', 'id_ID').format(date);
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

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
        body: SafeArea(
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
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage(
                                          initialIndex: 0,
                                        )),
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
                      borderRadius: BorderRadius.circular(20),
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
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: const Color.fromRGBO(122, 167, 165, 100),
                          width: 3.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Jadwal Hari Ini',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(fontSize: 20),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              getFormattedDate(today),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Container(
                          width: double.infinity,
                          height: screenHeight * 0.08,
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: screenHeight * 0.08,
                                  padding: const EdgeInsets.fromLTRB(
                                      kDefaultPadding / 2,
                                      0,
                                      kDefaultPadding / 2,
                                      0),
                                  decoration: const BoxDecoration(
                                    color: Color.fromRGBO(180, 198, 193, 1.0),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      bottomLeft: Radius.circular(20),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '13.00 - 14.00',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineLarge!
                                          .copyWith(fontSize: 16),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  height: screenHeight * 0.08,
                                  padding: const EdgeInsets.fromLTRB(
                                      kDefaultPadding / 2,
                                      0,
                                      kDefaultPadding / 2,
                                      0),
                                  decoration: const BoxDecoration(
                                    color: Color.fromRGBO(209, 220, 214, 1.0),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Follow Up SPJ',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      Text(
                                        'Nama Customer - Tempat',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: SizedBox(
          width: 100,
          height: 100,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AddSchedulePage()),
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
