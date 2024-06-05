import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'schedule_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
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
                  SizedBox(height: 20),
                  _buildStats(),
                  SizedBox(height: 20),
                  _buildECatalog(),
                  SizedBox(height: 20),
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
              Icon(Icons.person, size: 50),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hi, Salesman 1',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Container(
                    margin: EdgeInsets.only(top: 4),
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
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Text(title, style: TextStyle(fontSize: 14)),
      ],
    );
  }

  Widget _buildECatalog() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('E-Catalog',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Container(
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
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
            Text(
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
              child: Icon(Icons.date_range, size: 24),
            ),
          ],
        ),
        SizedBox(height: 5),
        Text('Kamis, 21 Maret 2024', style: TextStyle(fontSize: 14)),
        SizedBox(height: 10),
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
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(16),
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
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(task, style: TextStyle(fontSize: 14)),
              Text(details, style: TextStyle(fontSize: 14)),
            ],
          ),
        ],
      ),
    );
  }
}
