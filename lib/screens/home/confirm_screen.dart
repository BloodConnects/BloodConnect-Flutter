import 'package:blood_donation_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmScreen extends StatelessWidget {
  const ConfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                'Your blood request is accepted.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 26,
                  color: Colors.black,
                ),
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                Get.to(HomeScreen());
              },
              child: const Text(
                'Back to Home',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Inter',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
