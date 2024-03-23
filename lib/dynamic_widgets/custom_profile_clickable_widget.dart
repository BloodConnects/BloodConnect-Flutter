import 'package:flutter/material.dart';

Widget CustomClickableWidget({
  required VoidCallback onTap,
  required IconData icon,
  required String text,
  Color iconColor = Colors.black,
  Color textColor = Colors.black,
  double iconSize = 24.0,
  double spacing = 12.0,
  double fontSize = 16.0,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 6),
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        child: Row(
          children: [
            Icon(
              icon,
              color: iconColor,
              size: iconSize,
            ),
            SizedBox(
              width: spacing,
            ),
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontFamily: 'Inter',
                fontSize: fontSize,
              ),
            )
          ],
        ),
      ),
    ),
  );
}
