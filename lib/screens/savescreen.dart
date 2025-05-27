import 'package:faam_link/widgets/notificationcontainer.dart';
import 'package:faam_link/widgets/savedcontainer.dart';
import 'package:flutter/material.dart';

class Savescreen extends StatelessWidget {
  const Savescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.more_horiz,
                    color: Colors.black,
                    size: 20,
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.filter_alt,
                        color: Colors.black,
                        size: 20,
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.map_outlined,
                        color: Colors.black,
                        size: 20,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 15),
              const Text(
                'Saved',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '12 properties',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SavedContainer(),
              SavedContainer(),
              SavedContainer(),
              SavedContainer()
            ],
          ),
        ),
      ),
    );
  }
}
