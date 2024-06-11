import 'package:flutter/material.dart';

class SitemapPage extends StatefulWidget {
  const SitemapPage({super.key});

  @override
  State<SitemapPage> createState() => _SitemapPageState();
}

class _SitemapPageState extends State<SitemapPage> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.height;

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/SitemapBackground.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Center(
            child: Image.asset(
              'assets/images/Sitemap.png',
              height: screenHeight * 0.8,
              width: screenWidth * 0.5,
            ),
          ),
        ),
      ),
    );
  }
}
