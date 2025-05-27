import 'package:faam_link/screens/account.dart';
import 'package:faam_link/screens/forms/airrelocationform.dart';
import 'package:faam_link/screens/connects.dart';
import 'package:faam_link/screens/forms/cargopacking.dart';
import 'package:faam_link/screens/forms/expressdeliveryform.dart';
import 'package:faam_link/screens/forms/flatforms.dart';
import 'package:faam_link/screens/formscreen.dart';
import 'package:faam_link/screens/forms/internationalrelocation.dart';
import 'package:faam_link/screens/forms/landrelocationform.dart';
import 'package:faam_link/screens/mapsetting.dart';
import 'package:faam_link/screens/notifications.dart';
import 'package:faam_link/screens/forms/officerelocationform.dart';
import 'package:faam_link/screens/savescreen.dart';
import 'package:faam_link/screens/forms/seafreightform.dart';
import 'package:faam_link/screens/search.dart';
import 'package:faam_link/screens/forms/storageform.dart';
import 'package:faam_link/screens/forms/villashiftingform.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // List of screens to switch between
  final List<Widget> _screens = [
    const HomeContent(), // Home/Browse screen content
    const Connects(),
    const Savescreen(),
    const Notifications(),
    const Account(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Browse',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.messenger_sharp),
            label: 'Connect',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_3_rounded),
            label: 'Account',
          ),
        ],
        backgroundColor: Color(0xffFFFFFF),
        selectedItemColor: const Color(0xff1D62F0),
        unselectedItemColor: Color(0xffC8C7CC),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

// Separate widget for the Home/Browse screen content
class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width for responsive sizing
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        shadowColor: const Color(0xffFFFFFF),
        surfaceTintColor: const Color(0xffFFFFFF),
        backgroundColor: const Color(0xffFFFFFF),
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MapOptionsScreen()),
                );
              },
              child:
                  Icon(Icons.location_pin, color: Color(0xffFF2D55), size: 25),
            ),
            const SizedBox(width: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Location',
                  style: TextStyle(
                    color: Color(0xff666666),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'San Francisco, California',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.notifications, color: Colors.black),
                onPressed: () {},
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      color: Color(0xffFF2D55), shape: BoxShape.circle),
                  constraints: const BoxConstraints(
                    minWidth: 14,
                    minHeight: 14,
                  ),
                  child: Text(
                    '2',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LocationSearchScreen()),
                );
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: Color(0xffFFFFFF),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    )
                  ],
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Color(0xff8A8A8F)),
                    const SizedBox(width: 10),
                    Text(
                      'Search for everything...',
                      style: TextStyle(color: Color(0xff8A8A8F)),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Responsive row for category icons
            Container(
              height: 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildCategoryIcon('Villa', Icons.villa, screenWidth),
                  const SizedBox(width: 8),
                  _buildCategoryIcon('Hotel', Icons.hotel, screenWidth),
                  const SizedBox(width: 8),
                  _buildCategoryIcon('House', Icons.house, screenWidth),
                  const SizedBox(width: 8),
                  _buildCategoryIcon('Apt', Icons.apartment, screenWidth),
                  const SizedBox(width: 8),
                  _buildCategoryIcon('Cabin', Icons.cabin, screenWidth),
                ],
              ),
            ),
            const SizedBox(height: 25),
            Text(
              'Services',
              style: TextStyle(
                color: Colors.black,
                fontSize: 34,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                padding: const EdgeInsets.only(top: 10),
                childAspectRatio: 0.75,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FlatFormScreen()));
                    },
                    child: _buildServiceCard('Flat Shifting',
                        'assets/images/flatshifting.jpg', context),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VillaFormScreen()));
                    },
                    child: _buildServiceCard('Villa Shifting',
                        'assets/images/villashifting.jpg', context),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OfficeRelocationScreen()));
                    },
                    child: _buildServiceCard(
                        'Office Relocation',
                        'assets/images/WhatsApp Image 2025-05-20 at 03.05.33_64f9cc86.jpg',
                        context),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  InternationalRelocationScreen()));
                    },
                    child: _buildServiceCard(
                        'International Relocation',
                        'assets/images/WhatsApp Image 2025-05-20 at 22.56.22_36e12326.jpg',
                        context),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  StorageAndWarehousingScreen()));
                    },
                    child: _buildServiceCard('Storage and Warehousing',
                        'assets/images/storagehousing.jpeg', context),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Seafreightform()));
                    },
                    child: _buildServiceCard(
                        'Sea Frieght',
                        'assets/images/WhatsApp Image 2025-05-20 at 03.05.40_376b1f61.jpg',
                        context),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Landrelocationform()));
                    },
                    child: _buildServiceCard(
                        'Land Frieght',
                        'assets/images/WhatsApp Image 2025-05-20 at 03.05.40_b1b0b5eb.jpg',
                        context),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FormScreen()));
                    },
                    child: _buildServiceCard(
                        'Air Frieght',
                        'assets/images/WhatsApp Image 2025-05-20 at 03.05.41_c8c03653.jpg',
                        context),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Expressdeliveryform()));
                    },
                    child: _buildServiceCard(
                        'Express Delivery',
                        'assets/images/WhatsApp Image 2025-05-20 at 22.56.22_8da38ba9.jpg',
                        context),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CargoPackagingForm()));
                    },
                    child: _buildServiceCard('Cargo Packaging',
                        'assets/images/cargopackaging.jpeg', context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryIcon(String label, IconData icon, double screenWidth) {
    // Calculate compact size based on screen width
    final iconSize = screenWidth * 0.06; // Responsive icon size
    final containerPadding = EdgeInsets.symmetric(horizontal: 8, vertical: 8);

    return Container(
      padding: containerPadding,
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min, // Only take necessary space
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xffE6F0FA),
            ),
            child: Icon(icon, color: const Color(0xff1D62F0), size: iconSize),
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(
      String title, String imagePath, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // Gradient overlay for text
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              // gradient: LinearGradient(
              //   begin: Alignment.topCenter,
              //   end: Alignment.bottomCenter,
              //   colors: [
              //     Colors.transparent,
              //     Colors.black.withOpacity(0.6),
              //   ],
              // ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
          ),

          // Favorite icon in top right corner
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.favorite_border,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
