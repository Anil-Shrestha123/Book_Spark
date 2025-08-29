import 'package:book_spark/Pages/auth/screen/log_in_page.dart';
import 'package:book_spark/Pages/auth/services/auth_service.dart';
import 'package:book_spark/pages/about_page.dart';
import 'package:book_spark/pages/dashboard_page.dart';
import 'package:book_spark/pages/silver_dashboard.dart';
import 'package:flutter/material.dart';

AuthMethod authMethod = AuthMethod();

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
                leading: Icon(Icons.home),
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
                leading: Icon(Icons.info),
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
                leading: Icon(Icons.dashboard),
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
              Divider(),
              //log out
              // ListTile(
              //   leading: Icon(Icons.dashboard),
              //   title: Text('Silver Dashboard'),
              //   onTap: () {
              //     authMethod.signOutUser();
              //   },
              // ),
              ElevatedButton(onPressed: () {
                authMethod.signOut();
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              }, child: Text("Log out"))
            ],
          ),
        ],
      ),
    );
  }
}