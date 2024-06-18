import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:intl/date_symbol_data_local.dart';
import 'package:sales_app/constants.dart';
import 'package:sales_app/pages/customer/customer_page.dart';
import 'package:sales_app/pages/home/notifications_modal.dart';
import 'package:sales_app/pages/new_order/new_order_page.dart';
import 'package:sales_app/pages/order_history/order_history_page.dart';
import 'package:sales_app/pages/sitemap/sitemap_page.dart';
import 'package:sales_app/sph/sph_page.dart';
import '../profile_sales/profile_page.dart';
import '../schedule/schedule_page.dart';

class HomePage extends StatefulWidget {
  // const HomePage({super.key});
  final int initialIndex;
  const HomePage({super.key, this.initialIndex = 0});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentPageIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        selectedIndex: _currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Pesanan',
          ),
          NavigationDestination(
              icon: Icon(Icons.add_circle_outline), label: 'New'),
          NavigationDestination(
            icon: Icon(Icons.map),
            label: 'Sitemap',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_add_alt_1),
            label: 'Customer',
          ),
        ],
      ),
      body: <Widget>[
        const HomeContent(),
        const OrderHistoryPage(),
        const NewOrderPage(),
        const SitemapPage(),
        const CustomerPage(),
      ][_currentPageIndex],
    );
  }
}

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  DateTime today = DateTime.now();
  final bool manager = true;
  String username = "Hi, Salesman 1";
  @override
  void initState() {
    super.initState();
    initializeDateFormatting('id_ID', null);
  }

  String getFormattedDate(DateTime date) {
    return intl.DateFormat('EEEE, d MMMM yyyy', 'id_ID').format(date);
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Home.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    CustomPaint(
                      painter: HomeCardBorderPainter(),
                      child: Container(
                        height: screenHeight * 0.29,
                      ),
                    ),
                    ClipPath(
                      clipper: CustomClipperHomeCard(),
                      clipBehavior: Clip.antiAlias,
                      child: Container(
                        width: double.infinity,
                        height: screenHeight * 0.29,
                        padding: const EdgeInsets.all(kDefaultPadding),
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromRGBO(0, 0, 0, 0.01),
                              Color.fromRGBO(0, 0, 0, 0.5)
                            ],
                            stops: [
                              0.75,
                              1.0,
                            ],
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ProfilePage()),
                                    );
                                  },
                                  child: Row(
                                    children: [
                                      const Icon(Icons.person, size: 50),
                                      const SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          LayoutBuilder(
                                            builder: (context, constraints) {
                                              TextStyle textStyle =
                                                  Theme.of(context)
                                                      .textTheme
                                                      .headlineLarge!
                                                      .copyWith(fontSize: 20);

                                              TextPainter textPainter =
                                                  TextPainter(
                                                text: TextSpan(
                                                  text: username,
                                                  style: textStyle,
                                                ),
                                                textDirection:
                                                    TextDirection.ltr,
                                              );
                                              textPainter.layout();

                                              double textWidth =
                                                  textPainter.width;

                                              return Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        username,
                                                        style: textStyle,
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        margin: const EdgeInsets
                                                            .only(top: 2.0),
                                                        height: 4,
                                                        width: textWidth * 0.5,
                                                        decoration:
                                                            const BoxDecoration(
                                                          color: Color.fromRGBO(
                                                              180,
                                                              198,
                                                              193,
                                                              1.0),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    30.0),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    30.0),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: const EdgeInsets
                                                            .only(top: 2.0),
                                                        height: 4,
                                                        width: textWidth * 0.5,
                                                        decoration:
                                                            const BoxDecoration(
                                                          color: Color.fromRGBO(
                                                              209,
                                                              220,
                                                              214,
                                                              1.0),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topRight:
                                                                Radius.circular(
                                                                    30.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    30.0),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        showNotificationModal(context);
                                      },
                                      child: const Icon(Icons.notifications),
                                    ),
                                    const SizedBox(width: 20),
                                    const Icon(Icons.mail),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: screenWidth * 0.25,
                                  height: screenHeight * 0.12,
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 24, 8, 0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: kSecondaryColor,
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                        '123',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineLarge!
                                            .copyWith(
                                              fontSize: 20,
                                            ),
                                      ),
                                      Text(
                                        'Total pesanan',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              fontSize: 12,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const SPHPage(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: screenWidth * 0.25,
                                    height: screenHeight * 0.12,
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 24, 8, 0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: kSecondaryColor,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          '123',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineLarge!
                                              .copyWith(
                                                fontSize: 20,
                                              ),
                                        ),
                                        Text(
                                          'Total SPH',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                fontSize: 12,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: screenWidth * 0.25,
                                  height: screenHeight * 0.12,
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 24, 8, 0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: kSecondaryColor,
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                        '123',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineLarge!
                                            .copyWith(
                                              fontSize: 20,
                                            ),
                                      ),
                                      Text(
                                        'Total SPR',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              fontSize: 12,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(kDefaultPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (manager == true) ...[
                            Container(
                              // width: double.infinity,
                              // height: screenHeight * 0.24,
                              padding:
                                  const EdgeInsets.fromLTRB(16, 16, 16, 16),
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(242, 242, 242, 0.4),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Jumlah Customer',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge!
                                        .copyWith(
                                          fontSize: 20,
                                        ),
                                  ),
                                  AspectRatio(
                                    aspectRatio: 1.7,
                                    child: LineChart(
                                      LineChartData(
                                        titlesData: const FlTitlesData(
                                          leftTitles: AxisTitles(
                                            sideTitles:
                                                SideTitles(showTitles: false),
                                          ),
                                          rightTitles: AxisTitles(
                                            sideTitles:
                                                SideTitles(showTitles: false),
                                          ),
                                          topTitles: AxisTitles(
                                            sideTitles:
                                                SideTitles(showTitles: false),
                                          ),
                                          bottomTitles: AxisTitles(
                                            sideTitles:
                                                SideTitles(showTitles: true),
                                          ),
                                        ),
                                        borderData: FlBorderData(
                                          show: true,
                                          border: Border.all(
                                              color: const Color(0xff37434d),
                                              width: 1),
                                        ),
                                        gridData: const FlGridData(show: false),
                                        lineBarsData: [
                                          LineChartBarData(
                                            spots: const [
                                              FlSpot(0, 3),
                                              FlSpot(2, 2),
                                              FlSpot(4, 4),
                                              FlSpot(6, 10),
                                            ],
                                            isCurved: true,
                                            isStrokeCapRound: true,
                                            dotData:
                                                const FlDotData(show: true),
                                            belowBarData: BarAreaData(
                                              show: true,
                                              gradient: const LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  Color.fromRGBO(
                                                      197, 229, 228, 1.0),
                                                  Color.fromRGBO(
                                                      244, 244, 244, 0.0),
                                                ],
                                                stops: [0.0, 1.0],
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
                            const SizedBox(
                              height: 16.0,
                            ),
                          ],
                          Text(
                            'E-Catalog',
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                  fontSize: 20,
                                ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            height: screenHeight * 0.24,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage('assets/images/catalog.png'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            height: screenHeight * 0.24,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          const SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const HomePage(initialIndex: 3),
                                ),
                              );
                            },
                            child: Container(
                              height: screenHeight * 0.24,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(20),
                                image: const DecorationImage(
                                    image:
                                        AssetImage('assets/images/Sitemap.png'),
                                    fit: BoxFit.fill),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(kDefaultPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Jadwal Hari Ini',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge!
                                        .copyWith(fontSize: 20),
                                  ),
                                  Text(
                                    getFormattedDate(DateTime.now()),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(fontSize: 14),
                                  ),
                                ],
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SchedulePage()),
                                  );
                                },
                                icon: const Icon(Icons.date_range,
                                    size: 30, color: Colors.black),
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
                                        kDefaultPadding, 0, kDefaultPadding, 0),
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
                                        kDefaultPadding, 0, kDefaultPadding, 0),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                          const SizedBox(
                            height: 10.0,
                          ),
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
                                        kDefaultPadding, 0, kDefaultPadding, 0),
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
                                        kDefaultPadding, 0, kDefaultPadding, 0),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                          const SizedBox(height: 10.0),
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
                                        kDefaultPadding, 0, kDefaultPadding, 0),
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
                                        kDefaultPadding, 0, kDefaultPadding, 0),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
