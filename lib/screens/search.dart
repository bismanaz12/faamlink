import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LocationSearchScreen extends StatelessWidget {
  const LocationSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEFEFF4),
      body: SafeArea(
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 36,
                      decoration: BoxDecoration(
                        color: const Color(0xffC8C7CC),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: const [
                          SizedBox(width: 8),
                          Icon(
                            CupertinoIcons.search,
                            color: Color(0xff8A8A8F),
                            size: 18,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Search',
                            style: TextStyle(
                                color: Color(0xff8A8A8F),
                                fontSize: 17,
                                fontWeight: FontWeight.w400),
                          ),
                          Spacer(),
                          Icon(
                            CupertinoIcons.xmark_circle_fill,
                            color: Color(0xff8A8A8F),
                            size: 18,
                          ),
                          SizedBox(width: 8),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                          color: Color(0xff666666),
                          fontSize: 17,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Nearby and Anywhere options
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(
                      Icons.near_me,
                      color: Color(0xff1D62F0),
                      size: 18,
                    ),
                    title: const Text(
                      'Nearby',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                  ),
                  const Divider(height: 1, indent: 56),
                  ListTile(
                    leading: const Icon(
                      Icons.place,
                      color: Color(0xff1D62F0),
                      size: 18,
                    ),
                    title: const Text(
                      'Anywhere',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Recent section
            Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Recent',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  const ListTile(
                    title: Text(
                      'House beside ocean',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                  ),
                  const Divider(height: 1, indent: 16),
                  const ListTile(
                    title: Text(
                      'San Francisco, CA',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                  ),
                  const Divider(height: 1, indent: 16),
                  const ListTile(
                    title: Text(
                      'Vintage house',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
