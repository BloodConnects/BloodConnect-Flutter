import 'package:blood_donation_app/custom_cards/custom_dialog_box.dart';
import 'package:blood_donation_app/custom_cards/dynamic_info_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

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
          'Profile',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            const Center(
              child: CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1648295194728-cb01f46ff985?q=80&w=449&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text(
                'User Full Name',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 45,
              width: 220,
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const CustomDialogBox();
                    },
                  );
                },
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.red)),
                child: const Text(
                  'Blood Request',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[300]),
              child: Column(
                children: [
                  DynamicInfoWidget(
                    title: 'Mobile Number',
                    subtitle: '+91 1234567890',
                  ),
                  DynamicInfoWidget(
                    title: 'Email Address',
                    subtitle: 'test@gmail.com',
                  ),
                  DynamicInfoWidget(
                    title: 'Age',
                    subtitle: '20',
                  ),
                  DynamicInfoWidget(
                    title: 'Blood Group',
                    subtitle: 'AB+',
                  ),
                  DynamicInfoWidget(
                    title: 'Address',
                    subtitle: 'Ahmedabad,Gujarat',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
