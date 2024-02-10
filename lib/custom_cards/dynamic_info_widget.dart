import 'package:flutter/material.dart';

class DynamicInfoWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final double radius;
  final FontWeight fontWeight2;
  final FontWeight fontWeight1;

  const DynamicInfoWidget({
    super.key,
    required this.title,
    required this.subtitle,
    this.radius = 22,
    this.fontWeight2 = FontWeight.bold,
    this.fontWeight1 = FontWeight.normal,
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: fontWeight1,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: fontWeight2,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
