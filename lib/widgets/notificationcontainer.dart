import 'package:flutter/material.dart';

class Notificationcontainer extends StatelessWidget {
  const Notificationcontainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4, // Adds subtle shadow for elevation
      shadowColor: Colors.grey.withOpacity(0.2), // Soft shadow color
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30), // Slightly larger radius
        side: BorderSide(
          color: Colors.grey.withOpacity(0.1), // Subtle border
          width: 1,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xffFFFFFF),
          borderRadius: BorderRadius.circular(30), // Matches card radius
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0), // Slightly increased padding
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image
              // Container

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      'assets/images/onboardings/onboarding3.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12), // Slightly increased spacing
              // Text Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 15, // Slightly larger for prominence
                          ),
                          children: [
                            TextSpan(text: 'Jane Mole '),
                            TextSpan(
                              text: 'has sold ',
                              style: TextStyle(fontWeight: FontWeight.w400),
                            ),
                            TextSpan(
                                text: '43 Bourke Street, Newbridge NSW 837'),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 8), // Increased spacing
                    const Text(
                      '34 minutes ago',
                      style: TextStyle(
                        color: Color(0xff666666),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
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
