import 'package:faam_link/widgets/notificationcontainer.dart';
import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

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
                children: const [
                  Icon(
                    Icons.more_horiz,
                    color: Colors.black,
                    size: 20,
                  ),
                  Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 20,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              const Text(
                'Notifications',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Notificationcontainer(),
              Notificationcontainer(),
              Notificationcontainer(),
              Notificationcontainer()
            ],
          ),
        ),
      ),
    );
  }
}
