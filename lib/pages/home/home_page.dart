import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:intl/date_symbol_data_local.dart';
import 'package:sales_app/constants.dart';
import 'package:sales_app/pages/customer/customer_page.dart';
import 'package:sales_app/pages/ecatalog/ecatalog.dart';
import 'package:sales_app/pages/home/notifications_modal.dart';
import 'package:sales_app/pages/new_order/new_order_page.dart';
import 'package:sales_app/pages/order_history/order_history_page.dart';
import 'package:sales_app/pages/sitemap/sitemap_page.dart';
import 'package:sales_app/pages/sph/sph_page.dart';
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
      bottomNavigationBar: Stack(
        children: [
          NavigationBar(
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

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
        fontSize: 12,
        color: Color.fromRGBO(
          24,
          24,
          25,
          0.42,
        ));
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = const Text('Jan', style: style);
        break;
      case 2:
        text = const Text('Feb', style: style);
        break;
      case 3:
        text = const Text('Mar', style: style);
        break;
      case 4:
        text = const Text('Apr', style: style);
        break;
      case 5:
        text = const Text('Mei', style: style);
        break;
      case 6:
        text = const Text('Jun', style: style);
        break;
      case 7:
        text = const Text('Jul', style: style);
        break;
      case 8:
        text = const Text('Aug', style: style);
        break;
      case 9:
        text = const Text('Sep', style: style);
        break;
      case 10:
        text = const Text('Oct', style: style);
        break;
      case 11:
        text = const Text('Nov', style: style);
        break;
      case 12:
        text = const Text('Dec', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  @override
  Widget build(BuildContext context) {
    // final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/Home.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Stack(
              children: [
                CustomPaint(
                  painter: HomeCardBorderPainter(),
                  child: Container(
                    height: 255,
                  ),
                ),
                ClipPath(
                  clipper: CustomClipperHomeCard(),
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                    width: double.infinity,
                    height: 255,
                    padding: const EdgeInsets.all(kDefaultPadding),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromRGBO(0, 0, 0, 0.03),
                          Color.fromRGBO(0, 0, 0, 0.3)
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

                                          TextPainter textPainter = TextPainter(
                                            text: TextSpan(
                                              text: username,
                                              style: textStyle,
                                            ),
                                            textDirection: TextDirection.ltr,
                                          );
                                          textPainter.layout();

                                          double textWidth = textPainter.width;

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
                                                    margin:
                                                        const EdgeInsets.only(
                                                            top: 10.0),
                                                    height: 4,
                                                    width: textWidth * 0.7,
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: Color.fromRGBO(
                                                          180, 198, 193, 1.0),
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
                                                    margin:
                                                        const EdgeInsets.only(
                                                            top: 10.0),
                                                    height: 4,
                                                    width: textWidth * 0.3,
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: Color.fromRGBO(
                                                          209, 220, 214, 1.0),
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
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return const NotificationModal();
                                      },
                                    );
                                  },
                                  child: const Icon(Icons.notifications),
                                ),
                                const SizedBox(width: 20),
                                const Icon(Icons.mail),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: kSecondaryColor,
                                  width: 2.0,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                    builder: (context) => const SPHPage(),
                                  ),
                                );
                              },
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: kSecondaryColor,
                                    width: 2.0,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: kSecondaryColor,
                                  width: 2.0,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 230,
                    ),
                    if (manager == true) ...[
                      const SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(
                          kDefaultPadding,
                          0,
                          kDefaultPadding,
                          kDefaultPadding,
                        ),
                        padding: const EdgeInsets.fromLTRB(
                          kDefaultPadding,
                          kDefaultPadding,
                          kDefaultPadding,
                          kDefaultPadding,
                        ),
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
                                    fontSize: 22,
                                  ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            AspectRatio(
                              aspectRatio: 2.78,
                              child: LineChart(
                                LineChartData(
                                  titlesData: FlTitlesData(
                                    leftTitles: const AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                    rightTitles: const AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                    topTitles: const AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                    bottomTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                        showTitles: true,
                                        interval: 1,
                                        getTitlesWidget: bottomTitleWidgets,
                                      ),
                                    ),
                                  ),
                                  borderData: FlBorderData(
                                    show: false,
                                  ),
                                  gridData: const FlGridData(show: false),
                                  lineBarsData: [
                                    LineChartBarData(
                                      spots: const [
                                        FlSpot(1, 0),
                                        FlSpot(2, 2),
                                        FlSpot(3, 2),
                                        FlSpot(4, 4),
                                        FlSpot(5, 10),
                                        FlSpot(6, 0),
                                        FlSpot(7, 2),
                                        FlSpot(8, 2),
                                        FlSpot(9, 4),
                                        FlSpot(10, 10),
                                        FlSpot(11, 12),
                                        FlSpot(12, 3),
                                      ],
                                      isCurved: true,
                                      isStrokeCapRound: true,
                                      dotData: const FlDotData(show: true),
                                      belowBarData: BarAreaData(
                                        show: true,
                                        gradient: const LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Color.fromRGBO(197, 229, 228, 1.0),
                                            Color.fromRGBO(244, 244, 244, 0.0),
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
                        height: 10.0,
                      ),
                    ],
                    Container(
                      margin: const EdgeInsets.fromLTRB(
                        kDefaultPadding,
                        0,
                        kDefaultPadding,
                        kDefaultPadding,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'E-Catalog',
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                  fontSize: 22,
                                ),
                          ),
                          const SizedBox(height: 16),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ECatalog(),
                                ),
                              );
                            },
                            child: Container(
                              height: 200,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image:
                                      AssetImage('assets/images/catalog.png'),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Container(
                      height: 200,
                      margin: const EdgeInsets.fromLTRB(
                        kDefaultPadding,
                        0,
                        kDefaultPadding,
                        kDefaultPadding,
                      ),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: [
                          Container(
                            width: screenWidth - 32,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          const SizedBox(
                            width: 16.0,
                          ),
                          Container(
                            width: screenWidth - 32,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
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
                        height: 200,
                        margin: const EdgeInsets.fromLTRB(
                          kDefaultPadding,
                          0,
                          kDefaultPadding,
                          kDefaultPadding,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                              image: AssetImage('assets/images/Sitemap.png'),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(
                        kDefaultPadding,
                        0,
                        kDefaultPadding,
                        kDefaultPadding,
                      ),
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
                                        .copyWith(fontSize: 22),
                                  ),
                                  Text(
                                    getFormattedDate(DateTime.now()),
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
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
                            height: 60,
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
                                    height: 60,
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
                                    height: 60,
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
                            height: 60,
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
                                    height: 60,
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
                                    height: 60,
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
                            height: 60,
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
                                    height: 60,
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
                                    height: 60,
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
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
