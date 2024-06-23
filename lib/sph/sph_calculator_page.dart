import 'package:flutter/material.dart';
import 'package:sales_app/constants.dart';

class SPHCalculatorPage extends StatefulWidget {
  const SPHCalculatorPage({super.key});

  @override
  State<SPHCalculatorPage> createState() => _SPHCalculatorPageState();
}

class _SPHCalculatorPageState extends State<SPHCalculatorPage> {
  final TextEditingController _totalPriceController = TextEditingController();
  final TextEditingController _interestController = TextEditingController();
  final TextEditingController _timePeriodController = TextEditingController();
  String? counted;

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
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Kalkulator SPH',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset('assets/images/arrow-left.png', height: 30),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(
                    kDefaultPadding,
                    0,
                    kDefaultPadding,
                    kDefaultPadding,
                  ),
                  padding: const EdgeInsets.fromLTRB(
                    kDefaultPadding,
                    0,
                    kDefaultPadding,
                    kDefaultPadding,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Harga Total',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(fontSize: 22),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: TextField(
                              controller: _totalPriceController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white30,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                    color: kSecondaryColor,
                                    width: 3.0,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                    color: kSecondaryColor,
                                    width: 3.0,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                    color: kSecondaryColor,
                                    width: 3.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Bunga',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(fontSize: 22),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: TextField(
                              controller: _interestController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white30,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                    color: kSecondaryColor,
                                    width: 3.0,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                    color: kSecondaryColor,
                                    width: 3.0,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                    color: kSecondaryColor,
                                    width: 3.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Jangka Waktu',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(fontSize: 22),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: TextField(
                              controller: _timePeriodController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white30,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                    color: kSecondaryColor,
                                    width: 3.0,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                    color: kSecondaryColor,
                                    width: 3.0,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                    color: kSecondaryColor,
                                    width: 3.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 32.0,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              counted = 'Hasil';
                            });
                          },
                          style: primaryButtonStyle,
                          child: Text(
                            'Hitung',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ),
                      ),
                      if (counted != null) ...[
                        const SizedBox(
                          height: 24.0,
                        ),
                        Text(
                          'Cicilan',
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
                        Container(
                          height: 100,
                          padding: const EdgeInsets.all(kDefaultPadding),
                          decoration: BoxDecoration(
                            color: Colors.white30,
                            border: Border.all(
                              color: kSecondaryColor,
                              width: 3.0,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        )
                      ],
                    ],
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
