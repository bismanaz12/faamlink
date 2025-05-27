import 'package:faam_link/screens/signinscreen.dart';
import 'package:faam_link/screens/verifynumber.dart';
import 'package:flutter/material.dart';

class Signupscreen extends StatelessWidget {
  Signupscreen({super.key});
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController mobile = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Get screen size for responsive scaling
    final size = MediaQuery.of(context).size;
    // Scaling factor based on a reference width (360dp, common for mobile)
    final scaleFactor = size.width / 360;

    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Calculate available height after padding
            final availableHeight = constraints.maxHeight;
            // Dynamic spacing to fit content
            final dynamicSpacing = availableHeight * 0.02 * scaleFactor;

            return Padding(
              padding: EdgeInsets.only(
                left: 25 * scaleFactor,
                right: 25 * scaleFactor,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome\nuser',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 40 * scaleFactor,
                              ),
                            ),
                            SizedBox(height: 10 * scaleFactor),
                            Text(
                              'Sign up to join',
                              style: TextStyle(
                                color: const Color(0xff666666),
                                fontWeight: FontWeight.w400,
                                fontSize: 22 * scaleFactor,
                              ),
                            ),
                          ],
                        ),
                        Stack(
                          children: [
                            CircleAvatar(
                              backgroundImage: const AssetImage(
                                  'assets/images/onboardings/onboarding3.png'),
                              radius: 40 * scaleFactor,
                            ),
                            Positioned(
                              bottom: 0 * scaleFactor,
                              right: 6 * scaleFactor,
                              child: Container(
                                height: 25 * scaleFactor,
                                width: 25 * scaleFactor,
                                decoration: const BoxDecoration(
                                  color: Color(0xff1D62F0),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 15 * scaleFactor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: dynamicSpacing),
                    TextFormField(
                      controller: name,
                      decoration: InputDecoration(
                        hintText: 'Name',
                        hintStyle: TextStyle(
                          color: const Color(0xff8A8A8F),
                          fontSize: 17 * scaleFactor,
                          fontWeight: FontWeight.w400,
                        ),
                        filled: true,
                        fillColor: const Color(0xffEFEFF4),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20 * scaleFactor),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20 * scaleFactor,
                          vertical: 10 * scaleFactor,
                        ),
                      ),
                    ),
                    SizedBox(height: dynamicSpacing),
                    TextFormField(
                      controller: email,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle: TextStyle(
                          color: const Color(0xff8A8A8F),
                          fontSize: 17 * scaleFactor,
                          fontWeight: FontWeight.w400,
                        ),
                        filled: true,
                        fillColor: const Color(0xffEFEFF4),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20 * scaleFactor),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20 * scaleFactor,
                          vertical: 10 * scaleFactor,
                        ),
                      ),
                    ),
                    SizedBox(height: dynamicSpacing),
                    TextFormField(
                      controller: password,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(
                          color: const Color(0xff8A8A8F),
                          fontSize: 17 * scaleFactor,
                          fontWeight: FontWeight.w400,
                        ),
                        filled: true,
                        fillColor: const Color(0xffEFEFF4),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20 * scaleFactor),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20 * scaleFactor,
                          vertical: 10 * scaleFactor,
                        ),
                      ),
                    ),
                    SizedBox(height: dynamicSpacing),
                    TextFormField(
                      controller: mobile,
                      decoration: InputDecoration(
                        hintText: 'Mobile',
                        hintStyle: TextStyle(
                          color: const Color(0xff8A8A8F),
                          fontSize: 17 * scaleFactor,
                          fontWeight: FontWeight.w400,
                        ),
                        filled: true,
                        fillColor: const Color(0xffEFEFF4),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20 * scaleFactor),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20 * scaleFactor,
                          vertical: 10 * scaleFactor,
                        ),
                      ),
                    ),
                    SizedBox(height: dynamicSpacing),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 20 * scaleFactor,
                        ),
                        SizedBox(width: 5 * scaleFactor),
                        Text(
                          'I agree to the ',
                          style: TextStyle(
                            color: const Color(0xff666666),
                            fontSize: 15 * scaleFactor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          'Terms of Service',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15 * scaleFactor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: dynamicSpacing),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 45 * scaleFactor),
                          backgroundColor: const Color(0xff1D62F0),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(20 * scaleFactor),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Verifynumber(),
                            ),
                          );
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17 * scaleFactor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: dynamicSpacing),
                    Padding(
                      padding: EdgeInsets.only(bottom: 25 * scaleFactor),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Have an account? ',
                              style: TextStyle(
                                color: const Color(0xff666666),
                                fontSize: 17 * scaleFactor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Signinscreen(),
                                  ),
                                );
                              },
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17 * scaleFactor,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
