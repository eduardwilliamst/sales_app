import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sales_app/constants.dart';
import 'package:sales_app/pages/order_history/order_data_page.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({super.key});

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/OrderHistoryBackground.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: kDefaultPadding, right: kDefaultPadding),
                        child: CupertinoSearchTextField(
                          controller: _searchController,
                          keyboardType: TextInputType.text,
                          backgroundColor: kTextFormFieldColor,
                          placeholder: 'Pencarian',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontSize: 12),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const OrderDataPage(),
                              ),
                            );
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.all(kDefaultPadding),
                          padding: const EdgeInsets.all(kDefaultPadding),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(242, 242, 242, 0.4),
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(color: kSecondaryColor, width: 3.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'No. - Nama Kavling',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .copyWith(fontSize: 16),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Nominal UTJ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(fontSize: 12),
                                      ),
                                      Text(
                                        'Status UTJ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(fontSize: 12),
                                      ),
                                      Text(
                                        'Status SPH',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(fontSize: 12),
                                      ),
                                      Text(
                                        'Status SPR',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 50,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Belum Disetujui',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(fontSize: 12),
                                      ),
                                      Text(
                                        'Belum Disetujui',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(fontSize: 12),
                                      ),
                                      Text(
                                        'Belum Disetujui',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(fontSize: 12),
                                      ),
                                      Text(
                                        'Belum Disetujui',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
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
