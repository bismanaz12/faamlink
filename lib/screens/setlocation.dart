import 'package:flutter/material.dart';
import 'package:faam_link/screens/chooselangauge.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsive sizing
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Define a scaling factor for padding and font sizes
    final paddingScale = screenWidth / 360; // Based on a reference width of 360dp
    final fontScale = screenWidth < 360 ? 0.9 : 1.0; // Adjust font size for smaller screens

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 25.0 * paddingScale, // Scale padding
            vertical: 40.0 * paddingScale,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.location_on,
                size: 60 * paddingScale, // Scale icon size
                color: const Color(0xFF1D62F0),
              ),
              SizedBox(height: 24 * paddingScale),
              Text(
                'Hello, nice to\nmeet you!',
                style: TextStyle(
                  fontSize: 40 * fontScale, // Scale font size
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16 * paddingScale),
              Text(
                'Set your location to start find new house around you',
                style: TextStyle(
                  fontSize: 17 * fontScale,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff666666),
                ),
              ),
              SizedBox(height: 32 * paddingScale),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Chooselangauge(),
                    ),
                  );
                },
                icon: Icon(
                  Icons.navigation,
                  color: Colors.white,
                  size: 20 * fontScale,
                ),
                label: Text(
                  'Use current location',
                  style: TextStyle(
                    fontSize: 16 * fontScale,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1D62F0),
                  minimumSize: Size(
                    screenWidth * 0.8, // 80% of screen width
                    45 * paddingScale,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30 * paddingScale),
                  ),
                ),
              ),
              SizedBox(height: 16 * paddingScale),
              Text(
                'We only access your location while you are using this incredible app',
                style: TextStyle(
                  fontSize: 17 * fontScale,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff666666),
                ),
              ),
              SizedBox(height: 24 * paddingScale),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'or set your location manually',
                  style: TextStyle(
                    fontSize: 17 * fontScale,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}