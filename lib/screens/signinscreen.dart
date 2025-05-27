import 'package:faam_link/screens/forgotpassword.dart';
import 'package:faam_link/screens/signupscreen.dart';
import 'package:flutter/material.dart';

class Signinscreen extends StatelessWidget {
  const Signinscreen({super.key});

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
              const SizedBox(height: 80),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome\nback',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 40,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Sign in to continue',
                    style: TextStyle(
                      color: const Color(0xff666666),
                      fontWeight: FontWeight.w400,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Email',
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
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Password',
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
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      ),
                      Text(
                        'Remember me',
                        style: TextStyle(
                          color: Color(0xff666666),
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Forgotpassword(),
                        ),
                      );
                    },
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(
                        color: Color(0xff666666),
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(300, 45),
                    backgroundColor: const Color(0xff1D62F0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(300, 45),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Color(0xff7C5EFA), width: 0.3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.facebook,
                        color: Colors.black,
                        size: 20,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Sign in with Facebook',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t have an account? ',
                      style: TextStyle(
                        color: Color(0xff666666),
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Signupscreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
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
