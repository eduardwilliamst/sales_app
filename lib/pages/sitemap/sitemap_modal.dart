import 'package:flutter/material.dart';
import 'package:sales_app/constants.dart';

class SitemapModal extends StatelessWidget {
  const SitemapModal({super.key});

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
            const DetailRow(label: 'No Kavling', value: '3'),
            const DetailRow(label: 'Tipe', value: 'Terra - Standard'),
            const DetailRow(label: 'Luas Tanah (LT)', value: '60 M2'),
            const DetailRow(label: 'Luas Bangunan (LB)', value: '71 M2'),
            const DetailRow(label: 'Kamar Mandi', value: '2'),
            const DetailRow(label: 'Kamar Tidur', value: '2'),
            const DetailRow(label: 'Kapasitas Car Port', value: '1'),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: secondaryButtonStyle,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Pesan Kavling',
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
    );
  }
}

class DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const DetailRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: Theme.of(context).textTheme.bodyLarge),
          Text(value, style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    );
  }
}

void showSitemapModal(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const SitemapModal();
    },
  );
}
