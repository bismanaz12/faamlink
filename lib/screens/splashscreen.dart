import 'package:faam_link/screens/onboradingscreens.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  String fontfamily = 'Silkscreen';

  @override
  void initState() {
    super.initState();

    // Correctly implemented Future.delayed
    Future.delayed(Duration(seconds: 3), () {
      // Navigate to OnboardingScreen1 after 3 seconds
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Onboradingscreen1()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1D62F0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // First part of text with one style
            Text(
              'Faam link freight',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 27,
                  fontWeight: FontWeight.w700),
            ),
            // Second part of text with a different style
            Text(
              'forwarding',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 27,
                  fontFamily: fontfamily,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
