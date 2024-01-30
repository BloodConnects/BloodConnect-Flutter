import 'package:blood_donation_app/dynamic_widgets/custom_profile_clickable_widget.dart';
import 'package:blood_donation_app/screens/profile/edit_profille_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        titleTextStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Inter',
            color: Colors.black),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1648295194728-cb01f46ff985?q=80&w=449&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                ),
              ),
              const SizedBox(
                height: 10,
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
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color.fromARGB(255, 219, 218, 218)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 6,
                        ),
                        CustomClickableWidget(
                          onTap: () {
                            Get.to(EditProfileScreen());
                          },
                          icon: Icons.edit,
                          text: 'Edit Profile',
                        ),
                        const Divider(color: Colors.white, thickness: 1.5),
                        CustomClickableWidget(
                          onTap: () {},
                          icon: Icons.share,
                          text: 'Social Sharing',
                        ),
                        const Divider(color: Colors.white, thickness: 1.5),
                        CustomClickableWidget(
                          onTap: () {},
                          icon: Icons.history,
                          text: 'History',
                        ),
                        const Divider(color: Colors.white, thickness: 1.5),
                        CustomClickableWidget(
                          onTap: () {},
                          icon: Icons.medical_services_outlined,
                          text: 'Medical Records',
                        ),
                        const Divider(color: Colors.white, thickness: 1.5),
                        CustomClickableWidget(
                          onTap: () {},
                          icon: Icons.settings,
                          text: 'Settings',
                        ),
                        const Divider(color: Colors.white, thickness: 1.5),
                        CustomClickableWidget(
                          onTap: () {},
                          icon: Icons.feedback_outlined,
                          text: 'Feedback',
                        ),
                        const Divider(color: Colors.white, thickness: 1.5),
                        CustomClickableWidget(
                          onTap: () {},
                          icon: Icons.help_center_outlined,
                          text: 'Help',
                        ),
                        const Divider(color: Colors.white, thickness: 1.5),
                        CustomClickableWidget(
                          onTap: () {},
                          icon: Icons.logout,
                          text: 'Log out',
                          textColor: Colors.red,
                          iconColor: Colors.red
                        ),
                        const SizedBox(
                          height: 6,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}