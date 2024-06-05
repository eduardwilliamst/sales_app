import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'schedule_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Pesanan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.new_releases),
            label: 'New',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Sitemap',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Customer',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Home.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(context),
                  const SizedBox(height: 20),
                  _buildStats(),
                  const SizedBox(height: 20),
                  _buildECatalog(),
                  const SizedBox(height: 20),
                  _buildSchedule(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          },
          child: Row(
            children: [
              const Icon(Icons.person, size: 50),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Hi, Salesman 1',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    height: 4,
                    width: 100,
                    color: Colors.blue,
                  ),
                ],
              ),
            ],
          ),
        ),
        const Row(
          children: [
            Icon(Icons.notifications),
            SizedBox(width: 20),
            Icon(Icons.mail),
          ],
        ),
      ],
    );
  }

  Widget _buildStats() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildStatCard('Total Pesanan', '123'),
        _buildStatCard('Total SPH', '123'),
        _buildStatCard('Total SPR', '123'),
      ],
    );
  }

  Widget _buildStatCard(String title, String value) {
    return Column(
      children: [
        Text(value,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Text(title, style: const TextStyle(fontSize: 14)),
      ],
    );
  }

  Widget _buildECatalog() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('E-Catalog',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Container(
          height: 200,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage('assets/images/catalog.png'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 200,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 200,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    );
  }

  Widget _buildSchedule(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Jadwal Hari Ini',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SchedulePage()),
                );
              },
              child: const Icon(Icons.date_range, size: 24),
            ),
          ],
        ),
        const SizedBox(height: 5),
        const Text('Kamis, 21 Maret 2024', style: TextStyle(fontSize: 14)),
        const SizedBox(height: 10),
        _buildScheduleItem(
            '13.00 - 14.00', 'Follow Up SPJ', 'Nama Customer - Tempat'),
        _buildScheduleItem(
            '13.00 - 14.00', 'Follow Up SPJ', 'Nama Customer - Tempat'),
        _buildScheduleItem(
            '13.00 - 14.00', 'Follow Up SPJ', 'Nama Customer - Tempat'),
      ],
    );
  }

  Widget _buildScheduleItem(String time, String task, String details) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                time,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(task, style: const TextStyle(fontSize: 14)),
              Text(details, style: const TextStyle(fontSize: 14)),
            ],
          ),
        ],
      ),
    );
  }
}
