import 'package:flutter/material.dart';
import 'package:sales_app/constants.dart';

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
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  Container(
                    margin: const EdgeInsets.fromLTRB(
                      kDefaultPadding,
                      60,
                      kDefaultPadding,
                      0,
                    ),
                    // padding: const EdgeInsets.all(kDefaultPadding),
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
                  Container(
                    width: double.infinity,
                    height: 50,
                    margin: const EdgeInsets.fromLTRB(
                      0,
                      240,
                      0,
                      0,
                    ),
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
                ],
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

  const HouseCard({
    super.key,
    required this.imagePath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
            child: Image.asset(
              imagePath,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                ),
                child: const Text('Standard'),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                ),
                child: const Text('Deluxe'),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
        ],
      ),
    );
  }
}
