import 'package:flutter/material.dart';
import 'package:sales_app/constants.dart';
import 'package:sales_app/pages/ecatalog/catalog_modal.dart';

class ECatalog extends StatefulWidget {
  const ECatalog({super.key});

  @override
  State<ECatalog> createState() => _ECatalogState();
}

class _ECatalogState extends State<ECatalog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(235, 226, 211, 1.0),
            Color.fromRGBO(235, 226, 211, 1.0),
            Color.fromRGBO(244, 244, 244, 1.0)
          ],
          stops: [
            0.0,
            0.5,
            1.0,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 285,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/BannerECatalog.png'),
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter),
                    ),
                  ),
                  Positioned(
                    left: kDefaultPadding,
                    top: 60,
                    right: kDefaultPadding,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromRGBO(255, 255, 255, 0.6),
                            Color.fromRGBO(255, 255, 255, 0.3),
                            Color.fromRGBO(255, 255, 255, 0.6),
                            Color.fromRGBO(255, 255, 255, 0.3),
                          ],
                        ),
                        border: Border.all(
                          color: kSecondaryColor,
                          width: 5.0,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Image.asset(
                              'assets/images/arrow-left.png',
                            ),
                          ),
                          Text(
                            'Catalog Amesta Living',
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              'assets/images/document-download.png',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 240,
                    right: 0,
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      padding: const EdgeInsets.fromLTRB(
                          kDefaultPadding, 0, kDefaultPadding, kDefaultPadding),
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(235, 226, 211, 0.9),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: kDefaultPadding,
                  right: kDefaultPadding,
                ),
                child: GridView.count(
                  crossAxisSpacing: kDefaultPadding,
                  mainAxisSpacing: kDefaultPadding,
                  crossAxisCount: 2,
                  childAspectRatio: 160 / 170,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const <Widget>[
                    HouseCard(
                      imagePath: 'assets/images/BannerECatalog.png',
                      title: 'Nora',
                      deluxe: false,
                    ),
                    HouseCard(
                      imagePath: 'assets/images/BannerECatalog.png',
                      title: 'Sora',
                      deluxe: true,
                    ),
                    HouseCard(
                      imagePath: 'assets/images/BannerECatalog.png',
                      title: 'Terra',
                      deluxe: true,
                    ),
                    HouseCard(
                      imagePath: 'assets/images/BannerECatalog.png',
                      title: 'Kyra',
                      deluxe: true,
                    ),
                    HouseCard(
                      imagePath: 'assets/images/BannerECatalog.png',
                      title: 'Severa',
                      deluxe: true,
                    ),
                    HouseCard(
                      imagePath: 'assets/images/BannerECatalog.png',
                      title: 'Merra',
                      deluxe: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HouseCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final bool deluxe;

  const HouseCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.deluxe,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 5,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.1625,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 110),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(49, 58, 91, 0.0),
                  Color.fromRGBO(33, 39, 61, 1.0),
                  Color.fromRGBO(49, 58, 91, 0.22),
                  Color.fromRGBO(33, 39, 61, 1.0),
                ],
                stops: [
                  0.0,
                  0.47,
                  0.47,
                  1.0,
                ],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(kDefaultPadding / 2),
                      child: Text(
                        title,
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(fontSize: 20, color: kSecondaryColor),
                      ),
                    ),
                  ],
                ),
                if (deluxe == true) ...[
                  Padding(
                    padding: const EdgeInsets.only(
                      left: kDefaultPadding,
                      right: kDefaultPadding,
                      bottom: kDefaultPadding / 2,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CatalogModal(
                                  title: title,
                                  deluxe: false,
                                );
                              },
                            );
                          },
                          child: Text(
                            'Standard',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: kSecondaryColor),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CatalogModal(
                                  title: title,
                                  deluxe: true,
                                );
                              },
                            );
                          },
                          child: Text(
                            'Deluxe',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: kSecondaryColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ] else ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CatalogModal(
                                title: title,
                                deluxe: false,
                              );
                            },
                          );
                        },
                        child: Text(
                          'Standard',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: kSecondaryColor),
                        ),
                      ),
                      Text(
                        'Deluxe',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.transparent),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
