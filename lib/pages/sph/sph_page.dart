import 'package:flutter/material.dart';
import 'package:sales_app/constants.dart';
import 'package:sales_app/pages/sph/sph_data_page.dart';

class SPHPage extends StatefulWidget {
  const SPHPage({super.key});

  @override
  State<SPHPage> createState() => _SPHPageState();
}

class _SPHPageState extends State<SPHPage> {
  bool accepted = false;
  bool ongoing = false;
  bool rejected = true;
  bool manager = true;

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
            manager ? 'SPH' : 'SPH Ditolak',
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
                    padding: const EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: kDefaultPadding,
                    ),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: constraints.maxWidth * 0.3,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const SPHHistoryPage(),
                                    ),
                                  );
                                },
                                style: secondaryButtonStyle,
                                child: Text(
                                  'History',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .copyWith(
                                        color: kPrimaryColor,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SPHDataPage(),
                        ),
                      );
                    },
                    child: Container(
                        margin: const EdgeInsets.all(kDefaultPadding),
                        padding: const EdgeInsets.all(kDefaultPadding),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromRGBO(242, 242, 242, 0.5),
                              Color.fromRGBO(212, 232, 231, 0.5)
                            ],
                            stops: [0.0, 1.0],
                          ),
                          borderRadius: BorderRadius.circular(20),
                          border:
                              Border.all(color: kSecondaryColor, width: 3.0),
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
                                      'Sales',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineLarge!
                                          .copyWith(fontSize: 17),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      'Customer',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineLarge!
                                          .copyWith(fontSize: 17),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      'Kavling',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineLarge!
                                          .copyWith(fontSize: 17),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Nama Sales',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      'Nama Customer',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      'Nomor Kavling',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
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
                                  ],
                                ),
                              ],
                            ),
                          ],
                        )),
                  ),
                ] else ...[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SPHDataPage(),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(kDefaultPadding),
                      padding: const EdgeInsets.all(kDefaultPadding),
                      decoration: BoxDecoration(
                        // color: const Color.fromRGBO(242, 242, 242, 0.4),
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromRGBO(242, 242, 242, 0.5),
                            Color.fromRGBO(212, 232, 231, 0.5)
                          ],
                          stops: [0.0, 1.0],
                        ),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: kSecondaryColor, width: 3.0),
                      ),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Sales',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineLarge!
                                            .copyWith(fontSize: 17),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        'Customer',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineLarge!
                                            .copyWith(fontSize: 17),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        'Kavling',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineLarge!
                                            .copyWith(fontSize: 17),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Nama Sales',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        'Nama Customer',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        'Nomor Kavling',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                    ],
                                  ),
                                  if (accepted == true &&
                                      ongoing == false &&
                                      rejected == false) ...[
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
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
                                        ],
                                      ),
                                    ),
                                  ] else if (accepted == false &&
                                      ongoing == false &&
                                      rejected == true) ...[
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
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
                                      ),
                                    ),
                                  ] else if (accepted == false &&
                                      ongoing == true &&
                                      rejected == false) ...[
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
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
                                                    .copyWith(
                                                        color: Colors.black),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ]
                                ],
                              ),
                            ],
                          );
                        },
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

class SPHHistoryPage extends StatefulWidget {
  const SPHHistoryPage({super.key});

  @override
  State<SPHHistoryPage> createState() => _SPHHistoryPageState();
}

class _SPHHistoryPageState extends State<SPHHistoryPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  Color _indicatorColor = kErrorColor;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {
      _indicatorColor = _tabController.index == 0 ? kErrorColor : kSuccessColor;
    });
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabSelection);
    _tabController.dispose();
    super.dispose();
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
          title: Text(
            'SPH',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset(
              'assets/images/arrow-left.png',
              height: 30,
            ),
          ),
          bottom: TabBar(
            controller: _tabController,
            labelStyle: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.w900),
            unselectedLabelColor: Colors.black54,
            indicatorColor: _indicatorColor,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: const [
              Tab(text: 'Ditolak'),
              Tab(text: 'Disetujui'),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            SafeArea(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SPHDataPage(),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(kDefaultPadding),
                      padding: const EdgeInsets.all(kDefaultPadding),
                      decoration: BoxDecoration(
                        // color: const Color.fromRGBO(242, 242, 242, 0.4),
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromRGBO(242, 242, 242, 0.5),
                            Color.fromRGBO(212, 232, 231, 0.5)
                          ],
                          stops: [0.0, 1.0],
                        ),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: kSecondaryColor, width: 3.0),
                      ),
                      child: LayoutBuilder(
                        builder: (_, constraints) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Sales',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineLarge!
                                            .copyWith(fontSize: 17),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        'Customer',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineLarge!
                                            .copyWith(fontSize: 17),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        'Kavling',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineLarge!
                                            .copyWith(fontSize: 17),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Nama Sales',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        'Nama Customer',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        'Nomor Kavling',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                    ],
                                  ),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
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
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SafeArea(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SPHDataPage(),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(kDefaultPadding),
                      padding: const EdgeInsets.all(kDefaultPadding),
                      decoration: BoxDecoration(
                        // color: const Color.fromRGBO(242, 242, 242, 0.4),
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromRGBO(242, 242, 242, 0.5),
                            Color.fromRGBO(212, 232, 231, 0.5)
                          ],
                          stops: [0.0, 1.0],
                        ),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: kSecondaryColor, width: 3.0),
                      ),
                      child: LayoutBuilder(
                        builder: (_, constraints) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Sales',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineLarge!
                                            .copyWith(fontSize: 17),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        'Customer',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineLarge!
                                            .copyWith(fontSize: 17),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        'Kavling',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineLarge!
                                            .copyWith(fontSize: 17),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Nama Sales',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        'Nama Customer',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        'Nomor Kavling',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                    ],
                                  ),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
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
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
