import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback ontap;

  const CustomContainer({
    Key? key,
    required this.title,
    required this.icon,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 90,
        // width: 174,
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              icon,
              fit: BoxFit.cover,
              height: 45,
              width: 45,
            ),
            const SizedBox(
              width: 15,
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
      ),
    );
  }
}
