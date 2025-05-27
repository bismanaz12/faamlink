import 'package:flutter/material.dart';

class Callscontainer extends StatelessWidget {
  final bool isFavorite;
  final bool missed;

  const Callscontainer({
    super.key,
    this.isFavorite = true,
    required this.missed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                Row(
                  children: [
                    Icon(
                      Icons.call,
                      color: missed ? Color(0xffFF2D55) : Color(0xff4CD964),
                      size: 15,
                    ),
                    SizedBox(width: 4),
                    Text(
                      missed ? 'Missed' : 'Outgoing',
                      style: TextStyle(
                        color: missed ? Color(0xffFF2D55) : Color(0xff4CD964),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Time at the end
          Text(
            '11:20 AM',
            style: TextStyle(
              color: Color(0xff8C8C8C),
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
