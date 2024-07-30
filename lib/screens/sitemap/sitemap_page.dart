import 'package:flutter/material.dart';
import 'package:sales_app/constants.dart';
import 'package:sales_app/screens/sitemap/sitemap_modal.dart';

class SitemapPage extends StatefulWidget {
  const SitemapPage({super.key});

  @override
  State<SitemapPage> createState() => _SitemapPageState();
}

class _SitemapPageState extends State<SitemapPage> {
  @override
  Widget build(BuildContext context) {

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
          child: GestureDetector(
            onTap: () {
              showSitemapModal(context);
            },
            child: Container(
              margin: const EdgeInsets.all(kDefaultPadding),
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                image: DecorationImage(
                  image: AssetImage('assets/images/Sitemap.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
