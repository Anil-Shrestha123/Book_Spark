// import 'package:book_spark/Pages/auth/screen/log_in_page.dart';
// import 'package:book_spark/Pages/auth/services/auth_service.dart';
// import 'package:book_spark/pages/about_page.dart';
// import 'package:book_spark/pages/dashboard_page.dart';
// import 'package:book_spark/pages/silver_dashboard.dart';
// import 'package:flutter/material.dart';

// AuthMethod authMethod = AuthMethod();

// class DrawerPage extends StatelessWidget {
//   const DrawerPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         children: [
//           SizedBox(
//             height: 200.0,
//             child: const DrawerHeader(
//               decoration: BoxDecoration(color: Colors.tealAccent),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   CircleAvatar(
//                     radius: 40.0,
//                     backgroundImage: AssetImage('assets/images/profile.png'),
//                   ),
//                   SizedBox(height: 10.0),
//                   Text(
//                     'Develop By Team Fire',
//                     style: TextStyle(
//                       fontSize: 20.0,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                   ),
//                   SizedBox(height: 5.0),
//                   Text(
//                     'Anushka Das',
//                     style: TextStyle(
//                       fontSize: 16.0,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Column(
//             children: [
//               ListTile(
//                 leading: Icon(Icons.home),
//                 title: Text('Home Page'),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) {
//                         return DashboardPage();
//                       },
//                     ),
//                   );
//                 },
//               ),
//               Divider(),
//               ListTile(
//                 leading: Icon(Icons.info),
//                 title: Text('About'),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) {
//                         return AboutPage();
//                       },
//                     ),
//                   );
//                 },
//               ),
//               Divider(),
//               ListTile(
//                 leading: Icon(Icons.dashboard),
//                 title: Text('Silver Dashboard'),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) {
//                         return SilverDashboard();
//                       },
//                     ),
//                   );
//                 },
//               ),
//               Divider(),
//               //log out
//               // ListTile(
//               //   leading: Icon(Icons.dashboard),
//               //   title: Text('Silver Dashboard'),
//               //   onTap: () {
//               //     authMethod.signOutUser();
//               //   },
//               // ),
//               ElevatedButton(onPressed: () {
//                 authMethod.signOut();
//                 Navigator.pop(context);
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const LoginPage(),
//                   ),
//                 );
//               }, child: Text("Log out"))
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }


// drawer_page.dart
import 'package:book_spark/Pages/auth/screen/log_in_page.dart';
import 'package:book_spark/Pages/auth/services/auth_service.dart';
import 'package:book_spark/Pages/auth/services/user_service.dart';
import 'package:book_spark/pages/about_page.dart';
import 'package:book_spark/pages/dashboard_page.dart';
import 'package:book_spark/pages/silver_dashboard.dart';
import 'package:flutter/material.dart';

AuthMethod authMethod = AuthMethod();
UserService userService = UserService();

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  // String fullName = "Loading...";
  // String email = "Loading...";
  String fullName = "";
  String email = "";

  @override
  void initState() {
    super.initState();
    _loadUserDetails();
  }

  Future<void> _loadUserDetails() async {
    var details = await userService.getUserDetails();
    var user = userService.getCurrentUser();

    setState(() {
      email = user?.email ?? "No email";
      fullName = details?['name'] ?? user?.displayName ?? "No Name";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          SizedBox(
            height: 200.0,
            child: DrawerHeader(
              decoration: const BoxDecoration(color: Colors.tealAccent),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 40.0,
                    backgroundImage: AssetImage('assets/images/profile.png'),
                  ),
                  const SizedBox(height: 10.0),
                  // Full name (dynamic)
                  Text(
                    fullName,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  // Email (dynamic)
                  Text(
                    email,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Menu Items
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home Page'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const DashboardPage()),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AboutPage()),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text('Silver Dashboard'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SilverDashboard()),
              );
            },
          ),
          const Divider(),
          // Logout button
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text("Log out"),
            onTap: () async {
              await authMethod.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const LoginPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
