import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DonorListScreen extends StatelessWidget {
  const DonorListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CircleAvatar(
          radius: 15,
        ),
        title: const Text(
          'Donor List',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
