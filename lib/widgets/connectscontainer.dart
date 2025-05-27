import 'package:faam_link/screens/messagesscreen.dart';
import 'package:flutter/material.dart';

class Connectscontainer extends StatelessWidget {
  final bool isFavorite;

  const Connectscontainer({
    super.key,
    this.isFavorite = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MessageScreen()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // CircleAvatar with Stack
            Stack(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage:
                      AssetImage('assets/images/onboardings/onboarding3.png'),
                ),
                if (isFavorite)
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.favorite,
                        color: Colors.white,
                        size: 12,
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(width: 12),
            // Column with Expanded text widgets
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mexstuff Widstut',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Recent message',
                    style: TextStyle(
                      color: Color(0xff8C8C8C),
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            // Time and icon at the end
            Row(
              children: [
                Text(
                  '11:20 AM',
                  style: TextStyle(
                    color: Color(0xff8C8C8C),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Color(0xff8C8C8C),
                  size: 15,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
