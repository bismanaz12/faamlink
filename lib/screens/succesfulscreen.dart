import 'package:faam_link/screens/onboradingscreens.dart';
import 'package:flutter/material.dart';

class Success extends StatelessWidget {
  Success({super.key});

  String fontfamily = 'Silkscreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // First part of text with one style
            Container(
                height: 150,
                width: 150,
                child: Image.asset('assets/images/Group 6842.png',
                    fit: BoxFit.cover)),
            // Second part of text with a different style
            SizedBox(
              height: 5,
            ),
            Text(
              'Successfully',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              'Complete!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
