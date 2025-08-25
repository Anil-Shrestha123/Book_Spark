import 'package:book_spark/pages/drawer_page.dart';
import 'package:flutter/material.dart';

class SilverDashboard extends StatelessWidget {
  const SilverDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(child: DrawerPage()),
      appBar: AppBar(
        // leading: IconButton(
        //   icon: const Icon(Icons.menu),
        //   onPressed: () {},
        // ),
        title: const Text(
          "Sliver Page",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: const [
          Icon(Icons.notifications_none), //add button instead of icon
          SizedBox(width: 16),
          CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 35,
            child: Image(image: AssetImage('assets/images/profile.png')),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Quick Access Section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Quick Access",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => const DrawerPage(),
                            //   ),
                            // );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.pink.shade50,
                              border: Border.all(color: Colors.blue.shade100),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              children: const [
                                Icon(Icons.bookmark_border, size: 28),
                                SizedBox(height: 8),
                                Text("My Bookmark"),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            // Handle tap
                          },
                        
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.pink.shade50,
                                border: Border.all(color: Colors.blue.shade100),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                children: const [
                                  Icon(Icons.menu_book_outlined, size: 28),
                                  SizedBox(height: 8),
                                  Text("Browse Genres"),
                                ],
                              ),
                            ),
                          ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Popular Picks for You Section
            const Text(
              "Popular Picks for You",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 220,
              // width: double.infinity,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                separatorBuilder: (context, index) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  return Container(
                    width: 150,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey.shade200,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(height: 100, color: Colors.grey.shade400),
                            const Positioned(
                              top: 4,
                              right: 4,
                              child: Icon(Icons.bookmark_border, size: 20),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Text",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Text("Sub-text"),
                        const SizedBox(height: 6),
                        OutlinedButton(
                          onPressed: () {},
                          child: const Text("View Books"),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 24),

            // Recently Added Section
            const Text(
              "Recently Added",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 220,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                separatorBuilder: (context, index) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  return Container(
                    width: 150,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey.shade200,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(height: 100, color: Colors.grey.shade400),
                            const Positioned(
                              top: 4,
                              right: 4,
                              child: Icon(Icons.bookmark_border, size: 20),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Text",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Text("Sub-text"),
                        const SizedBox(height: 6),
                        OutlinedButton(
                          onPressed: () {},
                          child: const Text("View Books"),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_outlined),
            label: '',
          ),
        ],
      ),
    );
  }
}