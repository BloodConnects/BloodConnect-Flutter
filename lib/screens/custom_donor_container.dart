import 'package:flutter/material.dart';

class CustomDonorContainer extends StatelessWidget {
  const CustomDonorContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey[350]
      ),
    );
  }
}
