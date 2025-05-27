import 'package:faam_link/screens/signinscreen.dart';
import 'package:faam_link/screens/signupscreen.dart';
import 'package:flutter/material.dart';

// Utility class for responsive sizing
class SizeConfig {
  static late double screenWidth;
  static late double screenHeight;
  static late double referenceWidth;
  static late double referenceHeight;

  static void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    // Reference design size (e.g., a standard mobile screen)
    referenceWidth = 360; // Common Android width
    referenceHeight = 640; // Common Android height
  }

  // Get responsive width (scales based on screen width)
  static double getResponsiveWidth(double width) {
    return (width / referenceWidth) * screenWidth;
  }

  // Get responsive height (scales based on screen height)
  static double getResponsiveHeight(double height) {
    return (height / referenceHeight) * screenHeight;
  }

  // Get responsive font size (scales based on screen width for consistency)
  static double getResponsiveFontSize(double fontSize) {
    return (fontSize / referenceWidth) * screenWidth;
  }
}

class Onboradingscreen1 extends StatelessWidget {
  Onboradingscreen1({super.key});
  String fontfamily = 'Silkscreen';

  @override
  Widget build(BuildContext context) {
    // Initialize SizeConfig
    SizeConfig.init(context);

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/onboardings/onboarding1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: SizeConfig.getResponsiveHeight(20),
            ),
            Padding(
              padding: EdgeInsets.all(SizeConfig.getResponsiveWidth(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: SizeConfig.getResponsiveFontSize(17),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.getResponsiveHeight(50),
            ),
            Padding(
              padding: EdgeInsets.only(left: SizeConfig.getResponsiveWidth(20)),
              child: Text(
                'Faam link freight',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: SizeConfig.getResponsiveFontSize(20),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: SizeConfig.getResponsiveWidth(20)),
              child: Text(
                'forwarding',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: SizeConfig.getResponsiveFontSize(20),
                  fontFamily: fontfamily,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.getResponsiveHeight(40),
            ),
            Padding(
              padding: EdgeInsets.only(left: SizeConfig.getResponsiveWidth(20)),
              child: Text(
                '01.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: SizeConfig.getResponsiveFontSize(72),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: SizeConfig.getResponsiveWidth(20)),
              child: Text(
                'Discover house\nnear you',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: SizeConfig.getResponsiveFontSize(40),
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.getResponsiveHeight(15),
            ),
            Padding(
              padding: EdgeInsets.only(left: SizeConfig.getResponsiveWidth(20)),
              child: Text(
                'Find the best house you want by your\nlocation or neighborhood',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: SizeConfig.getResponsiveFontSize(17),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff1D62F0),
                  shape: const CircleBorder(),
                  fixedSize: Size(
                    SizeConfig.getResponsiveWidth(70),
                    SizeConfig.getResponsiveHeight(50),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Onboradingscreen2()));
                },
                child: Center(
                  child: Icon(
                    size: SizeConfig.getResponsiveFontSize(25),
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.white,
                    weight: 20,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.getResponsiveWidth(25),
                  vertical: SizeConfig.getResponsiveHeight(25)),
              child: Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      color: const Color.fromARGB(255, 204, 201, 201),
                      fontSize: SizeConfig.getResponsiveFontSize(18),
                    ),
                    children: [
                      const TextSpan(text: 'By joining you agree to our '),
                      TextSpan(
                        text: 'Terms of Service',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: SizeConfig.getResponsiveFontSize(18),
                        ),
                      ),
                      const TextSpan(text: ' and '),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: SizeConfig.getResponsiveFontSize(18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Onboradingscreen2 extends StatelessWidget {
  Onboradingscreen2({super.key});
  String fontfamily = 'Silkscreen';

  @override
  Widget build(BuildContext context) {
    // Initialize SizeConfig
    SizeConfig.init(context);

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/onboardings/onboarding2.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: SizeConfig.getResponsiveHeight(20),
            ),
            Padding(
              padding: EdgeInsets.all(SizeConfig.getResponsiveWidth(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: SizeConfig.getResponsiveFontSize(17),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.getResponsiveHeight(50),
            ),
            Padding(
              padding: EdgeInsets.only(left: SizeConfig.getResponsiveWidth(20)),
              child: Text(
                'Faam link freight',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: SizeConfig.getResponsiveFontSize(19),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: SizeConfig.getResponsiveWidth(20)),
              child: Text(
                'forwarding',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: SizeConfig.getResponsiveFontSize(19),
                  fontFamily: fontfamily,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.getResponsiveHeight(40),
            ),
            Padding(
              padding: EdgeInsets.only(left: SizeConfig.getResponsiveWidth(20)),
              child: Text(
                '02.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: SizeConfig.getResponsiveFontSize(72),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: SizeConfig.getResponsiveWidth(20)),
              child: Text(
                'Search for house\neasily',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: SizeConfig.getResponsiveFontSize(40),
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.getResponsiveHeight(15),
            ),
            Padding(
              padding: EdgeInsets.only(left: SizeConfig.getResponsiveWidth(20)),
              child: Text(
                'Decide where to sleep with family and\nfriends to enjoy the beautiful day',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: SizeConfig.getResponsiveFontSize(17),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff1D62F0),
                  shape: const CircleBorder(),
                  fixedSize: Size(
                    SizeConfig.getResponsiveWidth(70),
                    SizeConfig.getResponsiveHeight(50),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Onboradingscreen3()));
                },
                child: Center(
                  child: Icon(
                    size: SizeConfig.getResponsiveFontSize(25),
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.white,
                    weight: 20,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.getResponsiveWidth(25),
                  vertical: SizeConfig.getResponsiveHeight(25)),
              child: Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      color: const Color.fromARGB(255, 204, 201, 201),
                      fontSize: SizeConfig.getResponsiveFontSize(18),
                    ),
                    children: [
                      const TextSpan(text: 'By joining you agree to our '),
                      TextSpan(
                        text: 'Terms of Service',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: SizeConfig.getResponsiveFontSize(18),
                        ),
                      ),
                      const TextSpan(text: ' and '),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: SizeConfig.getResponsiveFontSize(18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Onboradingscreen3 extends StatelessWidget {
  Onboradingscreen3({super.key});
  String fontfamily = 'Silkscreen';

  @override
  Widget build(BuildContext context) {
    // Initialize SizeConfig
    SizeConfig.init(context);

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/onboardings/onboarding3.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: SizeConfig.getResponsiveHeight(20),
            ),
            Padding(
              padding: EdgeInsets.all(SizeConfig.getResponsiveWidth(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: SizeConfig.getResponsiveFontSize(17),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.getResponsiveHeight(50),
            ),
            Padding(
              padding: EdgeInsets.only(left: SizeConfig.getResponsiveWidth(20)),
              child: Text(
                'Faam link freight',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: SizeConfig.getResponsiveFontSize(19),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: SizeConfig.getResponsiveWidth(20)),
              child: Text(
                'forwarding',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: SizeConfig.getResponsiveFontSize(19),
                  fontFamily: fontfamily,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.getResponsiveHeight(40),
            ),
            Padding(
              padding: EdgeInsets.only(left: SizeConfig.getResponsiveWidth(20)),
              child: Text(
                '03.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: SizeConfig.getResponsiveFontSize(72),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: SizeConfig.getResponsiveWidth(20)),
              child: Text(
                'Ready to move in\nbeautiful house',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: SizeConfig.getResponsiveFontSize(40),
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.getResponsiveHeight(15),
            ),
            Padding(
              padding: EdgeInsets.only(left: SizeConfig.getResponsiveWidth(20)),
              child: Text(
                'A beautiful day with hot chocolate in a new\nplace with loved ones',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: SizeConfig.getResponsiveFontSize(17),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff1D62F0),
                  shape: const CircleBorder(),
                  fixedSize: Size(
                    SizeConfig.getResponsiveWidth(70),
                    SizeConfig.getResponsiveHeight(50),
                  ),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Signinscreen()));
                },
                child: Center(
                  child: Icon(
                    size: SizeConfig.getResponsiveFontSize(25),
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.white,
                    weight: 20,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.getResponsiveWidth(25),
                  vertical: SizeConfig.getResponsiveHeight(25)),
              child: Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      color: const Color.fromARGB(255, 204, 201, 201),
                      fontSize: SizeConfig.getResponsiveFontSize(18),
                    ),
                    children: [
                      const TextSpan(text: 'By joining you agree to our '),
                      TextSpan(
                        text: 'Terms of Service',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: SizeConfig.getResponsiveFontSize(18),
                        ),
                      ),
                      const TextSpan(text: ' and '),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: SizeConfig.getResponsiveFontSize(18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
