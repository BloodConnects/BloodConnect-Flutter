import 'package:flutter/material.dart';

class DynamicInfoWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final double radius;

  DynamicInfoWidget({
    required this.title,
    required this.subtitle, this.radius = 22,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
      child: Row(
        children: [
          CircleAvatar(
            radius: radius,
            backgroundColor: Colors.red[300],
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Inter',
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                subtitle,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}