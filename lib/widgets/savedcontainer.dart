import 'package:flutter/material.dart';

class SavedContainer extends StatelessWidget {
  const SavedContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 0, right: 0),
      child: Card(
        elevation: 4, // Adds subtle elevation
        shadowColor: Colors.grey.withOpacity(0.2), // Soft shadow for prominence
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25), // Matches existing radius
        ),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffFFFFFF),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image Container
                Container(
                  width: 100, // Fixed width for image
                  height: 100, // Fixed height for image
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: AssetImage(
                          'assets/images/onboardings/onboarding3.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black.withOpacity(0.5),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10), // Space between image and text
                // Text Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Lorem ipsum dolor sit amet consectetur. At turpis.',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '\$203.33',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Row(
                            children: const [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 20,
                              ),
                              SizedBox(width: 5),
                              Text(
                                '4.5',
                                style: TextStyle(
                                  color: Color(0xff666666),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
