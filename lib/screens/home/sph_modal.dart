import 'package:flutter/material.dart';
import 'package:sales_app/constants.dart';
import 'package:sales_app/screens/sph/sph_calculator_page.dart';

class SPHModal extends StatelessWidget {
  const SPHModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        // color: Colors.transparent,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: kSuccessColor,
                    width: 2.0,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '123',
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                fontSize: 20,
                                color: kSuccessColor,
                              ),
                    ),
                    Text(
                      'SPH Disetujui',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 12,
                            color: kSuccessColor,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: kErrorColor,
                    width: 2.0,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '123',
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                fontSize: 20,
                                color: kErrorColor,
                              ),
                    ),
                    Text(
                      'SPH Ditolak',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 12,
                            color: kErrorColor,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 50,
              top: 80,
              right: 50,
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
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                fontSize: 20,
                                color: kSecondaryColor,
                              ),
                    ),
                    Text(
                      'Total SPH',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 12,
                            color: kSecondaryColor,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 160,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: kWarningColor,
                    width: 2.0,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '123',
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                fontSize: 20,
                                color: kWarningColor,
                              ),
                    ),
                    Text(
                      'SPH Ongoing',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 12,
                            color: kWarningColor,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 0,
              top: 160,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SPHCalculatorPage()),
                      );
                    }, // Path ke gambar add button Anda
                    child: const Icon(
                      Icons.add_circle_sharp,
                      size: 75,
                      color: Color.fromRGBO(199, 174, 146, 1.0),
                    ), // Menghapus shadow
                  ),
                  Text(
                    'Kalkulator SPH',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 12,
                          color: const Color.fromRGBO(199, 174, 146, 1.0),
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
