import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sales_app/constants.dart';
import 'package:sales_app/screens/customer/add_customer_page.dart';
import 'package:sales_app/screens/customer/edit_customer_page.dart';
import 'package:sales_app/screens/customer/follow_up_page.dart';

class CustomerPage extends StatefulWidget {
  const CustomerPage({super.key});

  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/CustomerBackground.png'),
          fit: BoxFit.fitWidth,
          alignment: Alignment.topCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: kDefaultPadding,
                    top: kDefaultPadding,
                    right: kDefaultPadding,
                  ),
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
                Container(
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
                    border: Border.all(color: kSecondaryColor, width: 3.0),
                  ),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Nama',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge!
                                        .copyWith(fontSize: 17),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    'No. HP',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge!
                                        .copyWith(fontSize: 17),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    'No. HP',
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
                                    'Belum Disetujui',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    'Belum Disetujui',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    'Belum Disetujui',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                                  const FollowUpPage(),
                                            ),
                                          );
                                        },
                                        style: primaryButtonStyle,
                                        child: Text(
                                          'Follow Up',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    SizedBox(
                                      width: constraints.maxWidth * 0.3,
                                      height: 40,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const EditCustomerPage(),
                                            ),
                                          );
                                        },
                                        style: secondaryButtonStyle,
                                        child: Text(
                                          'Edit',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge!
                                              .copyWith(color: kPrimaryColor),
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
              ],
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
                    builder: (context) => const AddCustomerPage()),
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
