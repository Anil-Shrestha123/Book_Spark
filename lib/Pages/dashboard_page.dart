
// //import 'package:book_spark/pages/about_page.dart';
// import 'package:book_spark/pages/drawer_page.dart';
// import 'package:flutter/material.dart';

// class DashboardPage extends StatelessWidget {
//   const DashboardPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // List<List<dynamic>> image = [];
//     return Scaffold(
//       drawer: Drawer(
//         child: DrawerPage()
//       ),
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text(
//           "E-Library",
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         actions: const [
//           Icon(Icons.notifications_none),
//          // SizedBox(width: 16),
//           CircleAvatar(
//             // backgroundColor: Colors.grey,
//             radius: 35,
//             child: Image(image: AssetImage('assets/images/profile.png')),
//           ),
//           SizedBox(width: 16),
//           SizedBox(
//             height: 500,
//           ),
//         ],
//         // bottom: PreferredSize(
//         //   preferredSize: const Size.fromHeight(40),
//         //   child: Row(
//         //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         //     children: [
//         //       Padding(
//         //         padding: const EdgeInsets.only(top: 8.0),
//         //         child: ElevatedButton(
//         //           onPressed: () {},
//         //           style: ElevatedButton.styleFrom(
//         //             backgroundColor: Colors.white,
//         //             foregroundColor: Colors.black,
//         //             elevation: 0,
//         //             shape: RoundedRectangleBorder(
//         //               borderRadius: BorderRadius.circular(8),
//         //             ),
//         //           ),
//         //           child: const Text(
//         //             "Dashboard",
//         //             style: TextStyle(fontWeight: FontWeight.bold),
//         //           ),
//         //         ),
//         //       ),
//         //       Padding(
//         //         padding: const EdgeInsets.only(top: 8.0),
//         //         child: ElevatedButton(
//         //           onPressed: () {},
//         //           style: ElevatedButton.styleFrom(
//         //             backgroundColor: Colors.grey.shade200,
//         //             foregroundColor: Colors.grey,
//         //             elevation: 0,
//         //             shape: RoundedRectangleBorder(
//         //               borderRadius: BorderRadius.circular(8),
//         //             ),
//         //           ),
//         //           child: const Text(
//         //             "Catalog",
//         //             style: TextStyle(fontWeight: FontWeight.bold),
//         //           ),
//         //         ),
//         //       ),
//         //     ],
//         //   ),
//         // ),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.only(left: 16, right: 16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Subscription Status Box
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(16),
//               color: Colors.grey.shade200,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: const [
//                   Text(
//                     "Subscription Status",
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 10),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [Text("Membership Type:"), Text("Premium")],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [Text("Status:"), Text("Active")],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [Text("Expires On:"), Text("December 31, 2024")],
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 24),

//             // Borrowed Books Section
//             const Text(
//               "BORROWED BOOKS",
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 12),

//             ...List.generate(3, (index) {
//               return Padding(
//                 padding: const EdgeInsets.only(bottom: 16),
//                 child: Row(
//                   children: [
//                     Container(
//                       width: 80,
//                       height: 80,
//                       color: Colors.grey.shade300,
//                     ),
//                     const SizedBox(width: 16),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: const [
//                         Text(
//                           "Text",
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         Text("Sub-text"),
//                         Text("Date"),
//                       ],
//                     ),
//                   ],
//                 ),
//               );
//             }),

//             const SizedBox(height: 16),

//             // Membership Renewal Section
//             const Text(
//               "MEMBERSHIP RENEWAL",
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 12),

//             // Renew Button
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.black,
//                   foregroundColor: Colors.white,
//                 ),
//                 onPressed: () {},
//                 child: const Text("Renew Membership"),
//               ),
//             ),
//             const SizedBox(height: 10),

//             // Upgrade Button
//             SizedBox(
//               width: double.infinity,
//               child: OutlinedButton(
//                 onPressed: () {},
//                 child: const Text(
//                   "Upgrade Plan",
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),

//       // Bottom Navigation Bar
//       bottomNavigationBar: BottomNavigationBar(
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.menu_book_outlined),
//             label: '',
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:book_spark/pages/drawer_page.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(child: DrawerPage()),
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 1,
      //   //leading: Icon(Icons.menu, color: Colors.black),
      //   title: Text("Viewer", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      //   centerTitle: true,
      //   actions: [
      //     IconButton(
      //       icon: Icon(Icons.notifications_none, color: Colors.black),
      //       onPressed: () {},
      //     ),
      //     CircleAvatar(
      //       backgroundColor: Colors.grey.shade300,
      //       child: Icon(Icons.person, color: Colors.black),
      //     ),
      //     SizedBox(width: 10),
      //   ],
      // ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Viewer",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: const [
          Icon(Icons.notifications_none),
          // SizedBox(width: 16),
          CircleAvatar(
            // backgroundColor: Colors.grey,
            radius: 35,
            child: Image(image: AssetImage('assets/images/profile.png')),
          ),
          SizedBox(width: 16),
          SizedBox(height: 500),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_outlined),
            label: "",
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Welcome, Valued Reader!",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8),
            Text(
              "As a Viewer, you have exclusive access to a curated selection of public domain books. Upgrade your membership to unlock our full library and premium features.",
              style: TextStyle(fontSize: 15, color: Colors.black87),
            ),
            SizedBox(height: 20),

            // Upgrade Box
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Unlock the Full Library",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Upgrade your membership today and explore unlimited reads, exclusive content, and more!",
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 8),
                  // Membership Benefits
                  _buildBenefit(
                    Icons.check_circle_outline,
                    "Unlimited eBooks & Audiobooks",
                  ),
                  _buildBenefit(
                    Icons.check_circle_outline,
                    "Early Access to New Releases",
                  ),
                  _buildBenefit(
                    Icons.check_circle_outline,
                    "Personalized Reading Lists",
                  ),
                  SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF223A66),
                        foregroundColor: Colors.white,
                        //shape: StadiumBorder(),
                      ),
                      child: Text("Buy Membership"),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Explore Books
            Text(
              "Explore Public Books",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 12),

            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 6,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 180,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    SizedBox(height: 6),
                    Text("Text", style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("Sub-text"),
                    SizedBox(height: 6),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        minimumSize: Size(double.infinity, 30),
                      ),
                      child: Text("View Books"),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  //creating function for membership benefits
  Widget _buildBenefit(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.black87),
          SizedBox(width: 6),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }

  // Widget _buildBookCard() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Container(
  //         height: 80,
  //         decoration: BoxDecoration(
  //           color: Colors.grey.shade300,
  //           borderRadius: BorderRadius.circular(4),
  //         ),
  //       ),
  //       SizedBox(height: 6),
  //       Text("Text", style: TextStyle(fontWeight: FontWeight.bold)),
  //       Text("Sub-text"),
  //       SizedBox(height: 6),
  //       OutlinedButton(
  //         onPressed: () {},
  //         style: OutlinedButton.styleFrom(
  //           minimumSize: Size(double.infinity, 30),
  //         ),
  //         child: Text("View Books"),
  //       ),
  //     ],
  //   );
  // }
}
