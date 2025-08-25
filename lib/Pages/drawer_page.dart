import 'package:book_spark/pages/about_page.dart';
import 'package:book_spark/pages/dashboard_page.dart';
import 'package:book_spark/pages/silver_dashboard.dart';
import 'package:flutter/material.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 200.0,
            child: const DrawerHeader(
              decoration: BoxDecoration(color: Colors.tealAccent),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40.0,
                    backgroundImage: AssetImage('assets/images/profile.png'),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Develop By Team Fire',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    'Anushka Das',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              ListTile(
                title: Text('Home Page'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return DashboardPage();
                      },
                    ),
                  );
                },
              ),
              Divider(),
              ListTile(
                title: Text('About'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return AboutPage();
                      },
                    ),
                  );
                },
              ),
              Divider(),
              ListTile(
                title: Text('Silver Dashboard'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SilverDashboard();
                      },
                    ),
                  );
                },
              ),
              Divider()
            ],
          ),
        ],
      ),
    );
  }
}