import 'package:flutter/material.dart';

class CatalogModal extends StatelessWidget {
  final String title;
  final bool deluxe;
  const CatalogModal({super.key, required this.title, required this.deluxe});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              deluxe ? '$title Deluxe' : '$title Standard',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Luas Tanah (LT)',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 12, fontWeight: FontWeight.w700),
                ),
                Text(
                  '40 M2',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 12, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Luas Bangunan (LB)',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 12, fontWeight: FontWeight.w700),
                ),
                Text(
                  '53 M2',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 12, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const Divider(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.bed, size: 25),
                Icon(Icons.bathtub, size: 25),
                Icon(Icons.directions_car, size: 25),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '2',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 12, fontWeight: FontWeight.w700),
                ),
                Text(
                  '1',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 12, fontWeight: FontWeight.w700),
                ),
                Text(
                  '1',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 12, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
