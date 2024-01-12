import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String title;
  final IconData icon;

  const CustomContainer({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 173,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0.5, .5),
            blurRadius: 1,
            color: Colors.black
          )
        ]
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12 , right: 6, top: 8, bottom: 8),
            child: Icon(
              icon,
              size: 36,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black,
              fontFamily: 'Inter'
            ),
          )
        ],
      ),
    );
  }
}
