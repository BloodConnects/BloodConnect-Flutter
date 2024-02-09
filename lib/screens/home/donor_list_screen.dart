import 'package:blood_donation_app/custom_cards/custom_donor_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DonorListScreen extends StatelessWidget {
  const DonorListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(5.0),
          child: CircleAvatar(
            radius: 12,
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Donor List',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 18,
            fontWeight: FontWeight.bold ,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            const SizedBox(
              height: 15,
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 8,
              itemBuilder: (context, index) {
                return const CustomDonorContainer();
              },
            ),
          ],
        ),
      ),
    );
  }
}
