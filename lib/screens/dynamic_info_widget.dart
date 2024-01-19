import 'package:flutter/material.dart';

class DynamicInfoWidget extends StatelessWidget {
  final String title;
  final String subtitle;

  DynamicInfoWidget({
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 5, bottom: 5),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
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