import 'package:flutter/material.dart';

class CustomDotsIndicator extends StatelessWidget {
  final int dotsCount;
  final double position;

  const CustomDotsIndicator({
    required this.dotsCount,
    required this.position,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(dotsCount, (index) {
        return Container(
          width: 10,
          height: 10,
          margin: EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index == position.round() ? Colors.black : Colors.grey,
          ),
        );
      }),
    );
  }
}
