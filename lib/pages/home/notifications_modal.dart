import 'package:flutter/material.dart';

class NotificationModal extends StatelessWidget {
  const NotificationModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          gradient: const LinearGradient(
            colors: [
              Color.fromRGBO(235, 226, 211, 0.6),
              Color.fromRGBO(247, 229, 205, 0.5),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [
              0.0,
              0.49,
            ],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Notifikasi',
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(fontSize: 20),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Image.asset(
              'assets/images/notification.png',
              height: 100,
              width: 100,
            ),
            const SizedBox(height: 20),
            Text(
              'Tidak ada notifikasi baru',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
