import 'package:faam_link/screens/chooselangauge.dart';
import 'package:faam_link/screens/setlocation.dart';
import 'package:flutter/material.dart';

class Verifynumber extends StatelessWidget {
  const Verifynumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Verifying Number',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Text(
                'We’ve sent your verification code to\n+32 8304 5321',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter code',
                  hintStyle: TextStyle(
                    color: const Color(0xff8A8A8F),
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                  filled: true,
                  fillColor: const Color(0xffEFEFF4),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize:
                        Size(double.infinity, 45), // Match TextFormField width
                    backgroundColor: const Color(0xff1D62F0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LocationScreen()));
                  },
                  child: Text(
                    'Verify',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Resend code',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    '1:20 min left',
                    style: TextStyle(
                      color: Color(0xff8A8A8F),
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
