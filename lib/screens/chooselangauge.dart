import 'package:faam_link/screens/home.dart';
import 'package:flutter/material.dart';

class Chooselangauge extends StatelessWidget {
  const Chooselangauge({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 90),
              CircleAvatar(
                radius: 35,
                backgroundImage:
                    AssetImage('assets/images/onboardings/onboarding3.png'),
              ),
              SizedBox(height: 20),
              Text(
                'Hi, Huzaifa',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Please select your preferred language to facilitate communication',
                style: TextStyle(
                  color: Color(0xff666666),
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle_sharp,
                        color: Colors.green,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'English',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 20),
                  Row(
                    children: [
                      Icon(
                        Icons.circle_outlined,
                        color: Color(0xffD8D8D8),
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Chinese',
                        style: TextStyle(
                          color: Color(0xff666666),
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.circle_outlined,
                        color: Color(0xffD8D8D8),
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Portuguese',
                        style: TextStyle(
                          color: Color(0xff666666),
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 20),
                  Row(
                    children: [
                      Icon(
                        Icons.circle_outlined,
                        color: Color(0xffD8D8D8),
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Spanish',
                        style: TextStyle(
                          color: Color(0xff666666),
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.circle_outlined,
                        color: Color(0xffD8D8D8),
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Hindi',
                        style: TextStyle(
                          color: Color(0xff666666),
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 20),
                  Row(
                    children: [
                      Icon(
                        Icons.circle_outlined,
                        color: Color(0xffD8D8D8),
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Arabic',
                        style: TextStyle(
                          color: Color(0xff666666),
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 20),
                  Row(
                    children: [
                      Icon(
                        Icons.circle_outlined,
                        color: Color(0xffD8D8D8),
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Russian',
                        style: TextStyle(
                          color: Color(0xff666666),
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.circle_outlined,
                        color: Color(0xffD8D8D8),
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Bulgarian',
                        style: TextStyle(
                          color: Color(0xff666666),
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 20),
                  Row(
                    children: [
                      Icon(
                        Icons.circle_outlined,
                        color: Color(0xffD8D8D8),
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Lithuanian',
                        style: TextStyle(
                          color: Color(0xff666666),
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 45),
                    backgroundColor: const Color(0xff1D62F0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: Text(
                    'Select',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
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
