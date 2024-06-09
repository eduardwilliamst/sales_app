import 'package:flutter/material.dart';

class SitemapPage extends StatelessWidget {
  const SitemapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Image.asset(
            'assets/images/Sitemap.png',
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
