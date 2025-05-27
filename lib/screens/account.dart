import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  // State variables for switches
  bool newsletterEnabled = false;
  bool textMessagesEnabled = false;
  bool phoneCallsEnabled = false;

  @override
  Widget build(BuildContext context) {
    // Get screen size for responsive design
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final responsiveFontSize = screenWidth * 0.04; // Base font size for scaling
    final responsiveIconSize = screenWidth * 0.05; // Icon size scaling
    final responsiveAvatarRadius =
        screenWidth * 0.12; // Slightly increased avatar size

    return Scaffold(
      backgroundColor: const Color(0xffEFEFF4),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.more_horiz,
                  color: Colors.black,
                  size: responsiveIconSize,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // CircleAvatar at start
                  Stack(
                    children: [
                      CircleAvatar(
                        backgroundImage: const AssetImage(
                            'assets/images/onboardings/onboarding3.png'),
                        radius: responsiveAvatarRadius,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 6,
                        child: Container(
                          height: responsiveAvatarRadius * 0.5,
                          width: responsiveAvatarRadius * 0.5,
                          decoration: const BoxDecoration(
                            color: Color(0xff1D62F0),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: responsiveIconSize * 0.6,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 12), // Space between avatar and text
                  // Centered name and email
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Huzaifa Sajjad',
                          style: TextStyle(
                            fontSize: responsiveFontSize * 1.5,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'huzaifasajjad2005@gmail.com',
                          style: TextStyle(
                            fontSize: responsiveFontSize * 0.9,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff666666),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                'General',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: responsiveFontSize * 1.1,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xffFFFFFF),
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        'Q&A Participation',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: responsiveFontSize,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: const Color(0xffC8C7CC),
                        size: responsiveIconSize * 0.8,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    const Divider(
                      height: 1,
                      color: Color(0xffEFEFF4),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    ListTile(
                      title: Text(
                        'Ratings & Review',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: responsiveFontSize,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: const Color(0xffC8C7CC),
                        size: responsiveIconSize * 0.8,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    const Divider(
                      height: 1,
                      color: Color(0xffEFEFF4),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    ListTile(
                      title: Text(
                        'Customer Support',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: responsiveFontSize,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: const Color(0xffC8C7CC),
                        size: responsiveIconSize * 0.8,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    const Divider(
                      height: 1,
                      color: Color(0xffEFEFF4),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    ListTile(
                      title: Text(
                        'Help & Feedback',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: responsiveFontSize,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: const Color(0xffC8C7CC),
                        size: responsiveIconSize * 0.8,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    const Divider(
                      height: 1,
                      color: Color(0xffEFEFF4),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    ListTile(
                      title: Text(
                        'About',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: responsiveFontSize,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: const Color(0xffC8C7CC),
                        size: responsiveIconSize * 0.8,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                'Options',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: responsiveFontSize * 1.1,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xffFFFFFF),
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        'Newsletter',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: responsiveFontSize,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      trailing: Switch(
                        value: newsletterEnabled,
                        onChanged: (value) {
                          setState(() {
                            newsletterEnabled = value;
                          });
                        },
                        activeColor: Colors.white,
                        activeTrackColor: Colors.green,
                        inactiveThumbColor: Colors.white,
                        inactiveTrackColor:
                            const Color.fromARGB(255, 210, 208, 208),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    const Divider(
                      height: 1,
                      color: Color(0xffEFEFF4),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    ListTile(
                      title: Text(
                        'Text Messages',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: responsiveFontSize,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      trailing: Switch(
                        value: textMessagesEnabled,
                        onChanged: (value) {
                          setState(() {
                            textMessagesEnabled = value;
                          });
                        },
                        activeColor: Colors.white,
                        activeTrackColor: Colors.green,
                        inactiveThumbColor: Colors.white,
                        inactiveTrackColor:
                            const Color.fromARGB(255, 210, 208, 208),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    const Divider(
                      height: 1,
                      color: Color(0xffEFEFF4),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    ListTile(
                      title: Text(
                        'Phone Calls',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: responsiveFontSize,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      trailing: Switch(
                        value: phoneCallsEnabled,
                        onChanged: (value) {
                          setState(() {
                            phoneCallsEnabled = value;
                          });
                        },
                        activeColor: Colors.white,
                        activeTrackColor: Colors.green,
                        inactiveThumbColor: Colors.white,
                        inactiveTrackColor:
                            const Color.fromARGB(255, 210, 208, 208),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    const Divider(
                      height: 1,
                      color: Color(0xffEFEFF4),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    ListTile(
                      title: Text(
                        'Currency',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: responsiveFontSize,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '\$-USD',
                            style: TextStyle(
                              color: const Color(0xff8A8A8F),
                              fontSize: responsiveFontSize,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: const Color(0xffC8C7CC),
                            size: responsiveIconSize * 0.8,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    const Divider(
                      height: 1,
                      color: Color(0xffEFEFF4),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    ListTile(
                      title: Text(
                        'Languages',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: responsiveFontSize,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'English',
                            style: TextStyle(
                              color: const Color(0xff8A8A8F),
                              fontSize: responsiveFontSize,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: const Color(0xffC8C7CC),
                            size: responsiveIconSize * 0.8,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                'More',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: responsiveFontSize * 1.1,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xffFFFFFF),
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        'Privacy Policy',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: responsiveFontSize,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: const Color(0xffC8C7CC),
                        size: responsiveIconSize * 0.8,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    const Divider(
                      height: 1,
                      color: Color(0xffEFEFF4),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    ListTile(
                      title: Text(
                        'Accessibility',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: responsiveFontSize,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: const Color(0xffC8C7CC),
                        size: responsiveIconSize * 0.8,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    const Divider(
                      height: 1,
                      color: Color(0xffEFEFF4),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    ListTile(
                      title: Text(
                        'Terms of Use',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: responsiveFontSize,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: const Color(0xffC8C7CC),
                        size: responsiveIconSize * 0.8,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    const Divider(
                      height: 1,
                      color: Color(0xffEFEFF4),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    ListTile(
                      title: Text(
                        'Log Out',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: responsiveFontSize,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: const Color(0xffC8C7CC),
                        size: responsiveIconSize * 0.8,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
